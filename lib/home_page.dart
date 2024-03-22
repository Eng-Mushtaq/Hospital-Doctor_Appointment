import 'package:badges/badges.dart' as badge;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';
import 'theme/colors.dart';
import 'widgets/category_box.dart';
import 'widgets/textbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: badge.Badge(
              position: badge.BadgePosition.topEnd(top: 7, end: -4),
              badgeContent: Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(
                Icons.notifications_sharp,
                color: primary,
              ),
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Text(S.of(context).Hello,
                style: subTitle.copyWith(
                  fontSize: 23,
                  color: primary,
                  fontWeight: FontWeight.w500,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              child: Text(S.of(context).LtFndDoctor,
                  style: subTitle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w600))),
          SizedBox(
            height: 15,
          ),
          CustomTextBox(),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              S.of(context).Dept,
              style: titleText,
              // style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryBox(
                  title: S.of(context).Heart,
                  icon: Icons.favorite,
                  color: Colors.red,
                  onTap: () {
                    // Get.to(() => CategoryPage(
                    //       category: 'القلب',
                    //     ));
                  },
                ),
                CategoryBox(
                  title: S.of(context).Dermatologist,
                  icon: Icons.local_hospital,
                  color: Colors.blue,
                  onTap: () {
                    // Get.to(() => CategoryPage(
                    //       category: 'امراض  جلدية',
                    //     ));
                  },
                ),
                CategoryBox(
                  title: S.of(context).Dental,
                  icon: Icons.details_rounded,
                  color: Colors.purple,
                  onTap: () {
                    // Get.to(() => CategoryPage(
                    //       category: 'طب أسنان',
                    //     ));
                  },
                ),
                CategoryBox(
                  title: S.of(context).GeneralSurgery,
                  icon: Icons.healing_outlined,
                  color: Colors.green,
                  onTap: () {
                    // Get.to(() => CategoryPage(
                    //       category: 'جراحة عامة',
                    //     ));
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/vectors/electronic-health-record-concept-vector-id1299616187?k=20&m=1299616187&s=612x612&w=0&h=gmUf6TXc8w6NynKB_4p2TzL5PVIztg9UK6TOoY5ckMM="),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              child: Text(S.of(context).PopularDoctors, style: titleText
                  // TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
          SizedBox(height: 10),
          Center(
            child: Text(S.of(context).NoDoctors),
          )
        ]),
      ),
    );
  }
}
