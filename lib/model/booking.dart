class Booking {
  String? bookingId,
      doctorId,
      pationtId,
      date,
      day,
      time,
      status,
      doctor_name,
      doctor_profile,
      patient_name,
      patient_profile;

  String? createdAt;

  Booking({
    this.bookingId,
    this.doctorId,
    this.doctor_name,
    this.doctor_profile,
    this.patient_name,
    this.patient_profile,
    this.pationtId,
    this.date,
    this.day,
    this.time,
    this.status,
    this.createdAt,
  });

  Booking.fromJson(Map<String, dynamic> map, {String? bookingId}) {
// ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    this.bookingId = bookingId ?? this.bookingId;
    doctorId = map['doctorId'];
    doctor_name = map['doctor_name'];
    doctor_profile = map['doctor_profile'];
    patient_name = map['patient_name'];
    patient_profile = map['patient_profile'];
    pationtId = map['pationtId'];
    date = map['date'];
    day = map['day'];
    time = map['time'];
    status = map['status'];
    createdAt = map['createdAt'].toString();

    // mosqueModel = MosqueModel.fromJson(map['mosqueModel']);
  }
  toJson() {
    return {
      'doctorId': doctorId,
      'doctor_profile': doctor_profile,
      'doctor_name': doctor_name,
      'patient_profile': patient_profile,
      'patient_name': patient_name,
      'pationtId': pationtId,
      'date': date,
      'day': day,
      'time': time,
      'status': status,
      'createdAt': DateTime.now(),

      // 'mosqueModel': mosqueModel,
    };
  }
}
