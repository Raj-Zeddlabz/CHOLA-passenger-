import 'package:chola_passanger_ui/models/solo_ride_models/car_info_model.dart';
import 'package:chola_passanger_ui/models/solo_ride_models/driver_details_model.dart';
import 'package:chola_passanger_ui/services/common_services/common_service.dart';
import 'package:get/get.dart';

class SoloRideService extends GetxService {
  Future<List<CarInfoModel>> getCarInfo({
    required double pickupLat,
    required double pickupLng,
    required double destLat,
    required double destLng,
    required String city,
  }) async {
    try {
      List<CarInfoModel> carInfo = [];
      List<dynamic> data = await CommonService.getCarInfo(
          pickupLat: pickupLat,
          pickupLng: pickupLng,
          destLat: destLat,
          destLng: destLng,
          city: city);
      data.forEach((element) {
        carInfo.add(CarInfoModel.fromMap(element));
      });
      return carInfo;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<DriverDetailsModel> getDriverDetails({
    required double pickupLat,
    required double pickupLng,
    required double destLat,
    required double destLng,
    required String city,
    required int vehicleType,
    required int rideReqID,
    required double fare,
  }) async {
    try {
      final data = await CommonService.getAvailableDriver(
          pickupLat: pickupLat,
          pickupLng: pickupLng,
          destLat: destLat,
          destLng: destLng,
          city: city,
          vehicleType: vehicleType,
          rideReqID: rideReqID,
          fare: fare);
      return DriverDetailsModel.fromMap(data);
    } catch (e) {
      rethrow;
    }
  }
}
