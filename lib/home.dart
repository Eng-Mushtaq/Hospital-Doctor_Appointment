import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'accountPage.dart';

import 'appointmentPage.dart';
import 'doctor_page.dart';
import 'generated/l10n.dart';
import 'home_page.dart';
import 'theme/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages = [
    HomePage(),
    DoctorPage(),
    // ChatPage(),
    AppointmentsPage(),
    ProfileScrean()
  ];

  int _currentIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: _pages),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                 S.of(context).Home,
                  style: subTitle,
                ),
                icon: Icon(Icons.home)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                  S.of(context).Doctors,
                  style: subTitle,
                ),
                icon: Icon(Icons.medical_services_rounded)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                  S.of(context).Appointments,
                  style: subTitle,
                ),
                icon: Icon(Icons.event_note_rounded)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                  S.of(context).Profile,
                  style: subTitle,
                ),
                icon: Icon(Icons.manage_accounts_rounded)),
          ],
        ),
      ),
    );
  }
}
