import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/apis.dart';
import '../model/booking.dart';
import '../model/doctor_model.dart';
import '../theme/colors.dart';

enum FilterStatus { upcoming, complete, cancel }

class AppointmentsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var status = FilterStatus.upcoming.obs;
  var alignment = Alignment.centerLeft.obs;
  var schedules = <Booking>[].obs;
  var filteredSchedules = <Booking>[].obs;
  var statusWidget = Rxn<Widget>();
  // Added variables
  var userType = Rxn<String>();
  var doctor = Rxn<Doctor>();
  var userName = Rxn<String>();
  var imgUrl = Rxn<String>();

  // Updated to non-static method
  void getUserData(String userId) async {
    try {
      DocumentSnapshot userDocument =
          await firestore.collection('Doctors').doc(userId).get();
      if (userDocument.exists && userDocument.data() != null) {
        doctor.value =
            Doctor.fromJson(userDocument.data() as Map<String, dynamic>);
        userName.value = doctor.value?.name;
        imgUrl.value = doctor.value?.image;
        userType.value = doctor.value?.userType;
        update();
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Updated to non-static method and to use Rx variables
  Stream<QuerySnapshot<Map<String, dynamic>>> getAppointments(String userId) {
    getUserData(userId);
    // Using Rx variable with .value to access the current value
    String field = userType.value == 'Doctor' ? 'doctorId' : 'patientId';
    return firestore
        .collection('bookings')
        .where(field, isEqualTo: userId)
        .snapshots();
  }

  void changeStatus(FilterStatus newStatus) {
    status.value = newStatus;
    alignment.value = getAlignmentForStatus(newStatus);
    filterSchedules();
  }

  // void filterSchedules() {
  //   filteredSchedules.value = schedules.where((schedule) {
  //     return schedule.status == status.value.name;
  //   }).toList();
  // }

  void filterSchedules() {
    filteredSchedules.value = schedules.where((schedule) {
      switch (status.value) {
        case FilterStatus.upcoming:
          statusWidget.value = upcomming(schedule.bookingId);
          return schedule.status == 'upcoming';
        case FilterStatus.complete:
          statusWidget.value = completed();
          return schedule.status == 'complete';
        case FilterStatus.cancel:
          statusWidget.value = canceled();
          return schedule.status == 'cancel';
        default:
          return false;
      }
    }).toList();
  }

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

// Existing methods...
}
