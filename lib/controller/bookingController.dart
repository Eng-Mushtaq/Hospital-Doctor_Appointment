import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/booking.dart';
import '../model/doctor_model.dart';
import '../pages/succes_booking_page.dart';

class AppointmentController extends GetxController {
  // Variables to store user and appointment details
  var userType = ''.obs;
  var doctor = Rx<Doctor?>(null);
  var userName = ''.obs;
  var imgUrl = ''.obs;
  var filteredSchedules = <Booking>[].obs;
  // Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Function to get user data
  void getUserData(String userId) async {
    try {
      DocumentSnapshot userDocument =
          await firestore.collection('Doctors').doc(userId).get();
      if (userDocument.exists && userDocument.data() != null) {
        doctor.value =
            Doctor.fromJson(userDocument.data() as Map<String, dynamic>);
        userName.value = doctor.value?.name ?? '';
        imgUrl.value = doctor.value?.image ?? '';
        userType.value = doctor.value?.userType ?? '';
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Function to make an appointment
  Future<void> makeAppointment({
    String? docId,
    String? doctorName,
    String? doctorProfile,
    String? patientName,
    String? patientProfile,
    String? patId,
    String? date,
    String? day,
    String? time,
  }) async {
    try {
      await firestore.collection('bookings').add(Booking(
            doctorId: docId,
            doctor_name: doctorName,
            doctor_profile: doctorProfile,
            patient_name: userName.value,
            patient_profile: imgUrl.value,
            createdAt: DateTime.now().toString(),
            date: date,
            day: day,
            pationtId: patId,
            status: 'upcoming',
            time: time,
          ).toJson());

      Get.to(() => SuccessBookingPage());
    } catch (e) {
      print('Error making appointment: $e');
    }
  }

  // Function to get appointments stream
  Stream<QuerySnapshot<Map<String, dynamic>>> getAppointments(String userId) {
    getUserData(userId);
    String field = userType.value == 'Doctor' ? 'doctorId' : 'pationtId';
    return firestore
        .collection('bookings')
        .where(field, isEqualTo: userId)
        .snapshots();
  }

  Future<void> editAppointmentStatus(
      String appointmentId, String newStatus) async {
    try {
      // Update the status field of the specified appointment document
      await firestore.collection('bookings').doc(appointmentId).update({
        'status': newStatus,
      });
      // Handle post-update logic here, such as showing a confirmation message
      print('Appointment status updated to $newStatus');
    } catch (e) {
      print('Error updating appointment status: $e');
    }
  }

  void clearUserData() {
    userName.value = '';
    imgUrl.value = '';
    // Clear other user-related data if necessary
  }
}

// Include your Booking and Doctor class definitions here
