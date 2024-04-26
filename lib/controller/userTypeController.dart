import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/doctor_model.dart';

class UserTypeController extends GetxController {
  int? selectedUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxString userType = 'Doctor'.obs;
  void userToggile(int? usertype) {
    selectedUser = usertype;
    print(' user Type is ${selectedUser}');
  }

  void getUserData(String userId) async {
    try {
      // Fetch user data from Firestore using the userId
      DocumentSnapshot userDocument =
          await _firestore.collection('users').doc(userId).get();

      // Check if the document exists and contains data
      if (userDocument.exists && userDocument.data() != null) {
        // Parse the data into a Doctor object
        Doctor doctor =
            Doctor.fromJson(userDocument.data() as Map<String, dynamic>);
        // Assign the retrieved user type to the observable variable
        userType.value = doctor.userType ?? 'Doctor';
        // Notify listeners about the update
        update();
      }
    } catch (e) {
      // Handle errors or non-existent documents
      print('Error fetching user data: $e');
    }
  }
}
