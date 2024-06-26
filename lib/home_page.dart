import 'package:badges/badges.dart' as badge;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';
import 'model/doctor_model.dart';
import 'pages/categoryPage.dart';
import 'theme/colors.dart';
import 'widgets/category_box.dart';
import 'widgets/popular_doctor.dart';
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
    List<Doctor> popularDoctor = [];
    var currentUser = FirebaseAuth.instance.currentUser?.uid;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Text(
                // "مرحبا ,",
                S.of(context).Hello,
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
              child: Text(
                  // 'دعنا نبحث لك عن طبيب',
                  S.of(context).LtFndDoctor,
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
              // "الأقسام",
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
                  // title: "القلب",
                  title: S.of(context).Heart,

                  icon: Icons.favorite,
                  color: Colors.red,
                  onTap: () {
                    Get.to(() => CategoryPage(
                          category: S.of(context).Heart,
                        ));
                  },
                ),
                CategoryBox(
                  // title: "امراض  جلدية",
                  title: S.of(context).Dermatologist,
                  icon: Icons.local_hospital,
                  color: Colors.blue,
                  onTap: () {
                    Get.to(() => CategoryPage(
                          category: S.of(context).Dermatologist,
                        ));
                  },
                ),
                CategoryBox(
                  title: S.of(context).Dental,
                  icon: Icons.details_rounded,
                  color: Colors.purple,
                  onTap: () {
                    Get.to(
                      () => CategoryPage(
                        category: S.of(context).Dental,
                      ),
                    );
                  },
                ),
                CategoryBox(
                  title: S.of(context).GeneralSurgery,
                  icon: Icons.healing_outlined,
                  color: Colors.green,
                  onTap: () {
                    Get.to(() => CategoryPage(
                          category: S.of(context).GeneralSurgery,
                        ));
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
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Doctors')
                .where('userId', isNotEqualTo: currentUser)
                .where('userType', isEqualTo: 'Doctor')
                .snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  final data = snapshot.data!.docs;
                  popularDoctor =
                      data.map((e) => Doctor.fromJson(e.data())).toList();
              }
              if (popularDoctor.isNotEmpty) {
                return SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return PopularDoctor(doctor: popularDoctor[index]);
                      }),
                      separatorBuilder: (context, index) => SizedBox(width: 5),
                      itemCount: 4),
                );
              } else {
                return Center(
                  child: Text(S.of(context).NoDoctors),
                );
              }
              // SingleChildScrollView(
              //   padding: EdgeInsets.only(bottom: 5),
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       PopularDoctor(
              //         doctor: doctors[0],
              //       ),
              //       PopularDoctor(
              //         doctor: doctors[1],
              //       ),
              //       PopularDoctor(
              //         doctor: doctors[2],
              //       ),
              //       PopularDoctor(
              //         doctor: doctors[3],
              //       ),
              //     ],
              //   ),
              // ),
            },
          ),
        ]),
      ),
    );
  }
}
