import 'package:get/get.dart';

import '../../controller/appointmentsController.dart';
import '../../controller/bookingController.dart';
import '../../controller/doctorSignUpController.dart';
import '../../controller/loginController.dart';
import '../../controller/userTypeController.dart';
import '../../services/doctorService.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => DoctorSignUpController());
    // Get.put(LoginController());
    Get.put(AppointmentController());
    Get.put(FirestoreUsers());
    Get.put(UserTypeController());
    Get.put(BookingController());
  }
}
