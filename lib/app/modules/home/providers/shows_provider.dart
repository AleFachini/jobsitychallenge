import 'package:get/get.dart';

import 'package:jobsitychallenge/app/modules/home/shows_model.dart';

class ShowsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Shows.fromJson(map);
    httpClient.baseUrl = 'http://api.tvmaze.com/';
  }

  Future<Response<List<dynamic>>> getShows(int page) async =>
      await get('http://api.tvmaze.com/shows?page=$page');
  Future<Response<Shows>> getShow(int id) async => await get('shows/$id');
  Future<Response<Shows>> postShows(Shows shows) async =>
      await post('shows', shows);
  Future<Response> deleteShows(int id) async => await delete('shows/$id');
}
