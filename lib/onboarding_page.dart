import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category.dart';
import 'login_page.dart';
import 'theme/colors.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        finishButtonStyle: const FinishButtonStyle(backgroundColor: primary),
        headerBackgroundColor: Colors.white,
        finishButtonText: 'انشاء حساب ',
        finishButtonTextStyle:
            GoogleFonts.tajawal().copyWith(color: Colors.white),
        onFinish: () {
          Get.to(Category());
        },
        trailing: Text('تسجيل الدخول', style: GoogleFonts.tajawal()),
        trailingFunction: () {
          Get.to(LoginScreen());
        },
        skipTextButton: Text('تخطي', style: GoogleFonts.tajawal()),
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
                  height: 480,
                ),
                Text('مرحبا بكـ', style: title2Text),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'نسهل عليك عملية حجز موعد مع الطبيب المناسب في المستشفى من منزلك دون الحاجة للانتظار أو الاتصال.',
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
                  'رحلة صحية تبدأ بخطوة واحدة!',
                  style: title2Text,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'نؤمن  بأهمية صحتك ونسعى لتسهيل رحلتك العلاجية. يوفر لك التطبيق إمكانية حجز موعد مع الطبيب المناسب في المستشفى من منزلك بسهولة وسرعة.',
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
                  ' احجز موعدك في ثوانٍ',
                  style: title2Text,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'مع تطبيقنا، لم يعد الانتظار في طوابير المستشفيات أو الاتصال هاتفيًا لحجز موعد أمرًا ضروريًا. بضغطة زر واحدة، يمكنك حجز موعد مع طبيبك المفضل في الوقت الذي يناسبك.',
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
