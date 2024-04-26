import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_booking/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme/helper/pinding.dart';
import 'theme/language_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var language = prefs.getString('selectedLanguage') ?? 'English';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(savedLanguage: language));
}

class MyApp extends StatelessWidget {
  final String savedLanguage;

  MyApp({required this.savedLanguage, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.put(LanguageController());
    languageController.selectedLanguage.value = savedLanguage;
    return GetMaterialApp(
      initialBinding: Binding(),
      locale: languageController.selectedLanguage.value == 'English'
          ? const Locale('en')
          : const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Hospital Booking Appointment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoarding(),
    );
  }
}
