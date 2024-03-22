import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animations/bottomAnimation.dart';
import '../widgets/backBtnAndImage.dart';
import '../widgets/textField.dart';
import 'category.dart';
import 'generated/l10n.dart';
import 'home.dart';
import 'theme/colors.dart';

class LoginScreen extends StatelessWidget {
  // final LoginController loginController = Get.find();

  final emialController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateCNICVar = false;
  bool validateName = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom * 0.4),
            child: SafeArea(
              child: Container(
                width: width,
                // height: height,
                child: Stack(
                  children: <Widget>[
                    ImageAvatar(
                      assetImage: 'assets/bigDoc.png',
                    ),
                    BackBtn(),
                    Container(
                      width: width,
                      height: height,
                      margin:
                          EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Text(
                            S.of(context).SignIn,
                            style: titleText,
                          ),
                          // SizedBox(
                          //   height: height * 0.05,
                          // ),
                          textField(
                              inputType: TextInputType.emailAddress,
                              controller: emialController,
                              iconData: Icons.email_outlined,
                              lable: S.of(context).Email,
                              onSumbmit: () {
                                FocusScope.of(context).unfocus();
                              }),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          textField(
                              inputType: TextInputType.text,
                              controller: passwordController,
                              iconData: Icons.password_outlined,
                              lable: S.of(context).Password,
                              onSumbmit: () {
                                FocusScope.of(context).unfocus();
                              }),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            width: width,
                            height: height * 0.07,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {
                                Get.to(Home());
                                // loginController.signIn(emialController.text,
                                //     passwordController.text);
                              },
                              child:
                                  // loginController.isLoading.value
                                  //     ? CircularProgressIndicator()
                                  //     :
                                  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  WidgetAnimator(
                                    Image(
                                      image: AssetImage('assets/google.png'),
                                      height: height * 0.035,
                                    ),
                                  ),
                                  SizedBox(width: height * 0.015),
                                  Text(S.of(context).SignIn,
                                      style: subTitle.copyWith(
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          WidgetAnimator(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).HaveAccount,
                                  textAlign: TextAlign.center,
                                  style: subTitle.copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () => Get.off(() => Category()),
                                    child: Text(
                                      S.of(context).CreateNewAccount,
                                      style: subTitle,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
