// ignore_for_file: public_member_api_docs, sort_constructors_first

class DriverDetailsModel {
  final String driverName;
  final String lisenceNo;
  final String seats;
  final String carName;
  final String profileImage;
  final String carImageUrl;
  final String finalFare;
  final String driverId;

  DriverDetailsModel(
      {required this.driverName,
      required this.lisenceNo,
      required this.seats,
      required this.profileImage,
      required this.carName,
      required this.carImageUrl,
      required this.driverId,
      required this.finalFare});

  factory DriverDetailsModel.fromMap(Map<String, dynamic> map) {
    return DriverDetailsModel(
      driverId: (map['driverId'] as int).toString(),
      driverName: map['driverInfo']['user']['firstName'] as String,
      profileImage: "",
      lisenceNo: map['driverInfo']['vehicles'][0]['licensePlateNo'] as String,
      seats: "4",
      carName: map['driverInfo']['vehicles'][0]['vehicleCompany'] as String,
      carImageUrl: map['driverInfo']['vehicles'][0]['vehicleImage'] as String,
      finalFare: (map['finalFare'] as double).toString(),
    );
  }
}
