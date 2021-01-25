import 'package:get/get.dart';
import 'package:jobsitychallenge/app/modules/search/providers/search_provider.dart';
import 'package:jobsitychallenge/app/modules/search/widgets/dialog_seach.dart';

class SearchController extends GetxController
    with StateMixin<Response<List<dynamic>>> {
  String searchQuery = '';
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Get.dialog(DialogSearch());
  }

  void search() {
    SearchProvider().getSearch(searchQuery).then((resp) {
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

  @override
  void onClose() {}
}
