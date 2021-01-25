import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobsitychallenge/app/data/argument_show.dart';
import 'package:jobsitychallenge/app/modules/home/providers/shows_provider.dart';

class HomeController extends GetxController
    with StateMixin<Response<List<dynamic>>> {
  final isFavorite = false.obs;
  int _page = 0;
  ArgumentShow argShow = ArgumentShow();
  //scrollController for testing only
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    //in this case the page "0" is hardcoded because we start the app
    ShowsProvider().getShows(0).then((resp) {
      change(
        resp,
        status: RxStatus.success(),
      );
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }

  void loadPreviousPage() {
    if (_page != 0) {
      _page--;
      ShowsProvider().getShows(_page).then((resp) {
        change(
          resp,
          status: RxStatus.success(),
        );
      }, onError: (err) {
        change(
          null,
          status: RxStatus.error(err.toString()),
        );
      });
    } else {
      Get.snackbar('OOPS!', 'You are on First Page!');
    }
    return;
  }

  void loadNextPage() {
    _page++;
    print(_page);
    ShowsProvider().getShows(_page).then((resp) {
      change(
        resp,
        status: RxStatus.success(),
      );
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
    return;
  }

  void toFavorite() {
    isFavorite.value = !isFavorite.value;
    return;
  }

  void setDetailsArgument(int index, Map<String, dynamic> response) {
    this.argShow = ArgumentShow(
      index: index,
      id: response['id'],
      name: response['name'],
      imageOriginal: response['image']['original'],
      scheduleDays: response['schedule']['days'].join(', '),
      time: response['schedule']['time'],
      genres: response['genres'].join(', '),
      summary: response['summary'],
    );
    return;
  }
}
