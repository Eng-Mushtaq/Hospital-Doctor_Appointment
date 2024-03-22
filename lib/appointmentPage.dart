import 'package:flutter/material.dart';

import 'generated/l10n.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentsPageState extends State<AppointmentsPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Center(
                  child: Text(S.of(context).NoAppointments),
                ))));
  }
}
