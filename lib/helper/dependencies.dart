import 'package:chola_passanger_ui/controllers/getx_controllers.dart/solo_ride_controller.dart';
import 'package:chola_passanger_ui/controllers/other_controllers/location_controller.dart';
import 'package:chola_passanger_ui/services/solo_ride_service.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void initDependency() {
    Get.put<LocationController>(LocationController());
    Get.lazyPut<SoloRideService>(() => SoloRideService());
    Get.put<SoloRideController>(
        SoloRideController(soloService: Get.find<SoloRideService>()));
  }
}
