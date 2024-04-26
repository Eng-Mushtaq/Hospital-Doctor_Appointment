
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../home.dart';
import '../theme/colors.dart';
import '../widgets/mybutton.dart';

class SuccessBookingPage extends StatelessWidget {
  const SuccessBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: Image.asset('assets/success.gif')),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'تم الحجز بنجاح',
              style: titleText,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: MyButton(
              onTap: () => Get.to(() => Home()),
              title: 'الرجوع الى الرئيسية',
              width: double.infinity,
              disableButton:false ,
            ),
          )
        ],
      )),
    );
  }
}
