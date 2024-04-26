import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'English'.obs;
  var userType = ''.obs;
  var languages = [
    'English',
    'العربية',
  ];

  @override
  void onInit() {
    super.onInit();
    loadSelectedLanguage();
  }

  void loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var language = prefs.getString('selectedLanguage') ?? 'English';
    selectedLanguage.value = language;
  }

  void changeLanguage(String newLanguage) async {
    // selectedLanguage.value = newLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', newLanguage);
    updateLocale(newLanguage);
  }

  void updateLocale(String language) {
    var locale = Locale(language == 'English' ? 'en' : 'ar');
    Get.updateLocale(locale);
  }
}
