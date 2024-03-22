import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_booking/theme/language_controller.dart';
import 'category.dart';
import 'generated/l10n.dart';
import 'login_page.dart';
import 'theme/colors.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.put(LanguageController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // debugShowCheckedModeBanner: false,
      body: OnBoardingSlider(
        finishButtonStyle: const FinishButtonStyle(backgroundColor: primary),
        headerBackgroundColor: Colors.white,
        finishButtonText: S.of(context).CreateNewAccount,
        finishButtonTextStyle:
            GoogleFonts.tajawal().copyWith(color: Colors.white),
        onFinish: () {
          Get.to(Category());
        },
        trailing: Text(S.of(context).SignIn, style: GoogleFonts.tajawal()),
        trailingFunction: () {
          Get.to(LoginScreen());
        },
        skipTextButton: Text(S.of(context).Skip, style: GoogleFonts.tajawal()),
        background: [
          Image.asset(
            'assets/onboarding1.png',
            // height: size.height,
            width: size.width,
          ),

          Image.asset('assets/doctor1.png'),
          Image.asset(
            'assets/onboarding4.png',
            // height: size.height,
            width: size.width,
          ),
          // Image.asset('assets/slide_2.png'),
        ],
        totalPage: 3,
        speed: 1.8,
        controllerColor: primary,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 450,
                ),
                Text(S.of(context).Onboarding1Title, style: title2Text),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).SelectLanguage,
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => SizedBox(
                    height: 100,
                    child: DropdownButton<String>(
                      dropdownColor: appBgColor,
                      value: languageController
                          .selectedLanguage.value, // Set the initial value
                      onChanged: (newValue) {
                        languageController.changeLanguage(newValue!);
                      },

                      items: <String>[
                        'English',
                        'العربية',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: primary),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Text(
                  S.of(context).Onboarding1Desc,
                  style: subTitle,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  S.of(context).Onboarding2Title,
                  style: title2Text,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).Onboarding2Desc,
                  style: subTitle,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  S.of(context).Onboarding3Title,
                  style: title2Text,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).Onboarding3Desc,
                  textDirection: TextDirection.rtl,
                  style: subTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
