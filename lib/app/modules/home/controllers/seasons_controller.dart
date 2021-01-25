import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobsitychallenge/app/modules/home/providers/seasons_provider.dart';

class SeasonsController extends GetxController
    with StateMixin<Response<List<dynamic>>> {
  int showID = 1;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('ONREADY');
  }

  void getSeasons(int showId) {
    SeasonsProvider().getSeasons(showId).then((resp) {
      change(
        resp,
        status: RxStatus.success(),
      );
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
      print('${err.toString()}');
    });
    return;
  }

  void setShowID(int showid) {
    print(showid);
    this.showID = showid;
    return;
  }
}
