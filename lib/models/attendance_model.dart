class AttendanceModel {
  final String id;
  final String date;
  final String checkIn;
  final String? checkOut;
  final DateTime createdAt;
  final Map? checkInLocation;
  final Map? checkOutLocation;

  AttendanceModel(
      {required this.id,
      required this.checkIn,
      required this.checkOut,
      required this.createdAt,
      required this.date,
      this.checkInLocation,
      this.checkOutLocation});

  factory AttendanceModel.fromJson(Map<String, dynamic> data) {
    return AttendanceModel(
      id: data['Employee_id'],
      date: data['date'],
      checkIn: data['check_in'],
      checkOut: data['check_out'],
      createdAt: DateTime.parse(
        data['created_at'],
      ),
      checkInLocation: data['check_in_location'],
      checkOutLocation: data['check_out_location'],
    );
  }

  static fromJosn(attendance) {}
}
