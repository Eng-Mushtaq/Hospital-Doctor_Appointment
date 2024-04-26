import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../model/booking.dart';
import '../model/doctor_model.dart';
import '../model/message.dart';
import '../pages/login_page.dart';
import '../pages/succes_booking_page.dart';

class APIs {
  // for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  // for storing self information
  static late Doctor me;

  // to return current user
  static User get user => auth.currentUser!;

  // for accessing firebase messaging (Push Notification)
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;
  static List<Doctor> doctors = [];

  // for getting firebase messaging token
  static Future<void> getFirebaseMessagingToken() async {
    await fMessaging.requestPermission();
    await fMessaging.getToken().then((t) {
      if (t != null) {
        me.pushToken = t;
        log('Push Token: $t');
      }
    });
  }

  // for sending push notification
  static Future<void> sendPushNotification(Doctor chatUser, String msg) async {
    try {
      final body = {
        "to": chatUser.pushToken,
        "notification": {"title": chatUser.name, "body": msg}
      };

      var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                'key=AAAAQ0Bf7ZA:APA91bGd5IN5v43yedFDo86WiSuyTERjmlr4tyekbw_YW6JrdLFblZcbHdgjDmogWLJ7VD65KGgVbETS0Px7LnKk8NdAz4Z-AsHRp9WoVfArA5cNpfMKcjh_MQI-z96XQk5oIDUwx8D1'
          },
          body: jsonEncode(body));
      log('Response status: ${res.statusCode}');
      log('Response body: ${res.body}');
    } catch (e) {
      log('\nsendPushNotificationE: $e');
    }
  }

  // for checking if user exists or not?
  static Future<bool> userExists() async {
    return (await firestore.collection('Doctors').doc(user.uid).get()).exists;
  }

  // for getting current user info
  static Future<void> getSelfInfo() async {
    await firestore
        .collection('Doctors')
        .doc(user.uid)
        .get()
        .then((user) async {
      if (user.exists) {
        me = Doctor.fromJson(user.data()!);
        await getFirebaseMessagingToken();

        //for setting user status to active
        APIs.updateActiveStatus(true);
        log('My Data: ${user.data()}');
      } else {
        print('Ther is no user');
        await createUser().then((value) => getSelfInfo());
      }
    });
  }

  // for creating a new user
  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = Doctor(
      userId: user.uid,
      name: user.displayName.toString(),
      email: user.email.toString(),
      about: "Hey, I'm using We Chat!",
      image: user.photoURL.toString(),
      createdAt: time,
      isOnline: false,
      lastActive: time,
      pushToken: '',
    );

    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }

  // for getting all users from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return firestore
        .collection('Doctors')
        .where('userId', isNotEqualTo: user.uid)
        .snapshots();
  }

  // for updating user information
  static Future<void> updateUserInfo() async {
    await firestore.collection('users').doc(user.uid).update({
      'name': me.name,
      'about': me.about,
    });
  }

  // update profile picture of user
  static Future<void> updateProfilePicture(File file) async {
    //getting image file extension
    final ext = file.path.split('.').last;
    log('Extension: $ext');

    //storage file ref with path
    final ref = storage.ref().child('profile_pictures/${user.uid}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });

    //updating image in firestore database
    me.image = await ref.getDownloadURL();
    await firestore
        .collection('Doctors')
        .doc(user.uid)
        .update({'image': me.image});
  }

  // for getting specific user info
  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
      Doctor chatUser) {
    return firestore
        .collection('Doctors')
        .where('userId', isNotEqualTo: chatUser.userId)
        .snapshots();
  }

  // update online or last active status of user
  static Future<void> updateActiveStatus(bool isOnline) async {
    firestore.collection('users').doc(user.uid).update({
      'is_online': isOnline,
      'last_active': DateTime.now().millisecondsSinceEpoch.toString(),
      'push_token': me.pushToken,
    });
  }

  ///************** Chat Screen Related APIs **************

  // chats (collection) --> conversation_id (doc) --> messages (collection) --> message (doc)

  // useful for getting conversation id
  static String getConversationID(String id) => user.uid.hashCode <= id.hashCode
      ? '${user.uid}_$id'
      : '${id}_${user.uid}';

  // for getting all messages of a specific conversation from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      Doctor user) {
    return firestore
        .collection(
            'chats/${getConversationID(user.userId.toString())}/messages/')
        .orderBy('sent', descending: true)
        .snapshots();
  }

  // for sending message
  static Future<void> sendMessage(
      Doctor chatUser, String msg, messageType type) async {
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        toId: chatUser.userId!,
        msg: msg,
        read: '',
        type: type,
        fromId: user.uid,
        sent: time);

    final ref = firestore.collection(
        'chats/${getConversationID(chatUser.userId.toString())}/messages/');
    await ref.doc(time).set(message.toJson()).then(
          (value) => sendPushNotification(
              chatUser, type == messageType.text ? msg : 'image'),
        );
  }

  //update read status of message
  static Future<void> updateMessageReadStatus(Message message) async {
    firestore
        .collection('chats/${getConversationID(message.fromId)}/messages/')
        .doc(message.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  //get only last message of a specific chat
  static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
      Doctor user) {
    return firestore
        .collection(
            'chats/${getConversationID(user.userId.toString())}/messages/')
        .orderBy('sent', descending: true)
        .limit(1)
        .snapshots();
  }

  //send chat image
  static Future<void> sendChatImage(Doctor chatUser, File file) async {
    //getting image file extension
    final ext = file.path.split('.').last;

    //storage file ref with path
    final ref = storage.ref().child(
        'images/${getConversationID(chatUser.userId.toString())}/${DateTime.now().millisecondsSinceEpoch}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });

    //updating image in firestore database
    final imageUrl = await ref.getDownloadURL();
    await sendMessage(chatUser, imageUrl, messageType.image);
  }

  static logOut() {
    auth.signOut().then(
          (value) => Get.offAll(
            () => LoginScreen(),
          ),
        );
  }

  static Future makeAppointment({
    String? docId,
    String? doctor_name,
    String? doctor_profile,
    String? patient_name,
    String? patient_profile,
    String? patId,
    String? date,
    String? day,
    String? time,
  }) async {
    try {
      APIs.getUserData(FirebaseAuth.instance.currentUser!.uid);
      await firestore.collection('bookings').add(Booking(
            doctorId: docId,
            doctor_name: doctor_name,
            doctor_profile: doctor_profile,
            patient_name: userName,
            patient_profile: imgUrl,
            createdAt: DateTime.now().toString(),
            date: date,
            day: day,
            pationtId: patId,
            status: 'upcoming',
            time: time,
          ).toJson());

      Get.to(() => SuccessBookingPage());
    } catch (e) {
      return e;
    }
  }

  static String? userType;
  static Doctor? doctor;
  static String? userName;
  static String? imgUrl;

  static void getUserData(String userId) async {
    try {
      // Fetch user data from Firestore using the userId
      DocumentSnapshot userDocument =
          await firestore.collection('Doctors').doc(userId).get();
      // Check if the document exists and contains data
      if (userDocument.exists && userDocument.data() != null) {
        // Parse the data into a Doctor object
        doctor = Doctor.fromJson(userDocument.data() as Map<String, dynamic>);
        userName = doctor!.name;
        imgUrl = doctor!.image;
        print('///////////User Name');
        print(doctor!.name);
        // Assign the retrieved user type to the observable variable
        userType = doctor!.userType;
        // Notify listeners about the update
      }
    } catch (e) {
      // Handle errors or non-existent documents
      print('Error fetching user data: $e');
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAppointments(
      String userId) {
    getUserData(userId);
    String field = userType == 'Doctor' ? 'doctorId' : 'pationtId';
    print('field Is : ');
    print(field);
    return firestore
        .collection('bookings')
        .where(field, isEqualTo: userId)
        .snapshots();
  }

  static Future<void> editAppointmentStatus(
      {required String appointmentId, required String newStatus}) async {
    try {
      // Update the status field of the specified appointment document
      await firestore.collection('bookings').doc(appointmentId).update({
        'status': newStatus,
      }).then((value) {
        getAppointments(user.uid);
      });
      // Handle post-update logic here, such as showing a confirmation message
      print('Appointment status updated to $newStatus');
    } catch (e) {
      print('Error updating appointment status: $e');
    }
  }
}
