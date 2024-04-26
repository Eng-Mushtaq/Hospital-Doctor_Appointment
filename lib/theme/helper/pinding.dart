import 'package:get/get.dart';

import '../../controller/bookingController.dart';
import '../../controller/doctorSignUpController.dart';
import '../../controller/loginController.dart';
import '../../controller/userTypeController.dart';
import '../../services/doctorService.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(DoctorSignUpController());
    Get.put(LoginController());
    Get.put(FirestoreUsers());
    Get.put(UserTypeController());
    Get.put(AppointmentController());
  }
}
