import 'package:get/get.dart';

import 'package:jobsitychallenge/app/modules/home/seasons_model.dart';

class SeasonsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Seasons.fromJson(map);
    httpClient.baseUrl = 'http://api.tvmaze.com/';
  }

  Future<Response<List<dynamic>>> getSeasons(int id) async =>
      await get('http://api.tvmaze.com/shows/$id/seasons');
  Future<Response<Seasons>> postSeasons(Seasons seasons) async =>
      await post('seasons', seasons);
  Future<Response> deleteSeasons(int id) async => await delete('seasons/$id');
}
