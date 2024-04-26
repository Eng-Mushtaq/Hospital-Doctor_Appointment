import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../api/apis.dart';
import '../../model/booking.dart';
import '../../theme/colors.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentsPageState extends State<AppointmentsPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<Booking> schedules = [];
  List<Booking> filterSchduels = [];
  Alignment getAlignmentForStatus(FilterStatus status) {
    switch (status) {
      case FilterStatus.upcoming:
        return Alignment.centerRight;
      case FilterStatus.complete:
        return Alignment.center;
      case FilterStatus.cancel:
        return Alignment.centerLeft;
      default:
        return Alignment.centerLeft;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget upcomming(String? bookingId) {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.5,
                foregroundColor: Colors.white,
                backgroundColor: secondary,
              ),
              onPressed: () {
                APIs.editAppointmentStatus(
                    appointmentId: bookingId!, newStatus: 'cancel');
              },
              child: Text('Decline'),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Accept'),
              style: ElevatedButton.styleFrom(
                elevation: 0.5,
                foregroundColor: Colors.white,
                backgroundColor: primary,
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      );
    }

    Widget canceled() {
      return ElevatedButton(
        onPressed: () {},
        child: Text(
          'Canceled',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0.5,
          foregroundColor: Colors.white60,
          backgroundColor: primary,
        ),
      );
    }

    Widget completed() {
      return ElevatedButton(
        onPressed: () {},
        child: Text(
          'Completed',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0.5,
          foregroundColor: primary,
          backgroundColor: Colors.white60,
        ),
      );
    }

    Widget? statusWidget;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  APIs.getAppointments(FirebaseAuth.instance.currentUser!.uid),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data!.docs;
                    schedules = data.map((DocumentSnapshot document) {
                      // Create a Booking object from the document data and include the document ID as bookingId
                      return Booking.fromJson(
                        document.data() as Map<String, dynamic>,
                        bookingId: document
                            .id, // Pass the document ID to the Booking constructor
                      );
                    }).toList();
                    filterSchduels = schedules.where((schedule) {
                      switch (status) {
                        case FilterStatus.upcoming:
                          statusWidget = upcomming(schedule.bookingId);
                          return schedule.status == 'upcoming';
                        case FilterStatus.complete:
                          statusWidget = completed();
                          return schedule.status == 'complete';
                        case FilterStatus.cancel:
                          statusWidget = canceled();
                          return schedule.status == 'cancel';
                        default:
                          return false;
                      }
                    }).toList();
                }
                if (schedules.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'جدول الحجوزات',
                        style: titleText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (FilterStatus filterStatus
                                    in FilterStatus.values)
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          status = filterStatus;
                                          // Update the alignment based on the selected status
                                          _alignment = getAlignmentForStatus(
                                              filterStatus);
                                          // Filter the schedules based on the new status
                                          filterSchduels =
                                              schedules.where((schedule) {
                                            return schedule.status ==
                                                status.name;
                                          }).toList();
                                        });
                                      },
                                      child: Center(
                                        child: Text(
                                          filterStatus.name,
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AnimatedAlign(
                            alignment: _alignment,
                            duration: Duration(milliseconds: 200),
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  status.name,
                                  style: subTitle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                          itemCount: filterSchduels.length,
                          itemBuilder: (context, index) {
                            var _scheduel = filterSchduels[index];
                            bool _isLastElement =
                                filterSchduels.length + 1 == index;
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: _isLastElement
                                  ? const EdgeInsets.only(bottom: 20)
                                  : EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            // _scheduel['doctor_profile'],
                                            APIs.userType == 'Doctor'
                                                ? _scheduel.doctor_profile!
                                                : _scheduel.patient_profile!,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              // _scheduel['doctor_name'],
                                              APIs.userType == 'Doctor'
                                                  ? _scheduel.patient_name!
                                                  : _scheduel.doctor_name!,
                                              style: subTitle,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              // _scheduel['category'],
                                              _scheduel.time!,
                                              style: subTitle.copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ScheduelCard(sheduel: _scheduel),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    statusWidget ?? Container()
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Text('لا يوجد لديك حجوزات !'),
                  );
                }
              }),
        ),
      ),
    );
  }
}

class ScheduelCard extends StatelessWidget {
  ScheduelCard({super.key, this.sheduel});
  Booking? sheduel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.calendar_today,
            color: primary,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            // 'Monday 7/02/2023',
            sheduel!.day! + '   ' + sheduel!.date!,
            style: TextStyle(
              color: primary,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: primary,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            // '2:00 PM',
            sheduel!.time!,
            style: TextStyle(
              color: primary,
            ),
          ))
        ],
      ),
    );
  }
}
