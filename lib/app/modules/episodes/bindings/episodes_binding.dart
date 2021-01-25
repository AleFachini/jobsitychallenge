import 'package:get/get.dart';

import 'package:jobsitychallenge/app/modules/episodes/controllers/episodes_controller.dart';

class EpisodesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EpisodesController>(
      () => EpisodesController(),
    );
  }
}
