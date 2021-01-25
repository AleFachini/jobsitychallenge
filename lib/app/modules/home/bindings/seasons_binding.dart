import 'package:get/get.dart';
import 'package:jobsitychallenge/app/modules/home/controllers/seasons_controller.dart';

class SeasonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeasonsController>(
      () => SeasonsController(),
    );
  }
}
