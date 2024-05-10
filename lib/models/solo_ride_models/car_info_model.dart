import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CarInfoModel {
  final String carImageUrl;
  final String carName;
  final String price;
  final String estimatedTime;
  final String seats;
  final String vehicleTypeId;

  CarInfoModel(
      {required this.carImageUrl,
      required this.carName,
      required this.price,
      required this.estimatedTime,
      required this.vehicleTypeId,
      required this.seats});

  CarInfoModel copyWith({
    String? carImageUrl,
    String? carName,
    String? price,
    String? estimatedTime,
    String? seats,
    String? vehicleTypeId,
  }) {
    return CarInfoModel(
      carImageUrl: carImageUrl ?? this.carImageUrl,
      carName: carName ?? this.carName,
      price: price ?? this.price,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      seats: seats ?? this.seats,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
    );
  }

  factory CarInfoModel.fromMap(Map<String, dynamic> map) {
    return CarInfoModel(
      carImageUrl: '',
      carName: map['vehicleTypeName'] as String,
      price: (map['price'] as double).toString(),
      estimatedTime: (map['minTimeForArrival'] as int).toString(),
      vehicleTypeId: (map['vehicleTypeId'] as int).toString(),
      seats: '4',
    );
  }

  factory CarInfoModel.fromJson(String source) =>
      CarInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
