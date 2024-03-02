
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../theme/colors.dart';

class DoctorSignUpController extends GetxController {
  // var auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var specialController = TextEditingController();
  var addressController = TextEditingController();
  var licenceController = TextEditingController();
  var qualificationController = TextEditingController();
  var imageController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  RxBool isLoading = false.obs;
    List<String>categories = ['طب أسنان', 'امراض  جلدية', 'القلب','جراحة عامة'];




  String? emailValidator(String value) {
    String? pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "لا يجب ان يكون الايميل فارغا";
    } else if (!regex.hasMatch(value) ||
        !value.contains(
          '@gmail.com',
        )) {
      return 'صيغة الايميل غير صحيحة';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
    // Indian Mobile number are of 10 digit only
    if (value!.isEmpty || value.length != 9) {
      return 'يجب ان يحتوي رقم الهاتف على 9 أرقام';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    // Indian Mobile number are of 10 digit only
    if (value!.isEmpty || value.length < 6) {
      return ' يجب ان يكون طول كلمة المرور أكبر من 6 ';
    } else {
      return null;
    }
  }
}
