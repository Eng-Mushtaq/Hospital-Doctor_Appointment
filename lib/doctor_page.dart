import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'theme/colors.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        leading: Container(),

        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          S.of(context).Doctors,
          style: titleText.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        //  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Icon(
              Icons.info,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return Center(
      child: Text(S.of(context).NoData),
    );
  }

  getDoctorList() {
    return Center(
      child: Text(S.of(context).NoData),
    );
  }
}
