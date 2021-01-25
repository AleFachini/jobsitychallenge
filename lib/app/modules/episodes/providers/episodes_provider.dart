import 'package:get/get.dart';

import 'package:jobsitychallenge/app/modules/episodes/episodes_model.dart';

class EpisodesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Episodes.fromJson(map);
    httpClient.baseUrl = 'http://api.tvmaze.com/';
  }

  Future<Response<List<dynamic>>> getEpisodes(int seasonId) async =>
      await get('http://api.tvmaze.com/seasons/$seasonId/episodes');
  Future<Response<Episodes>> postEpisodes(Episodes episodes) async =>
      await post('episodes', episodes);
  Future<Response> deleteEpisodes(int id) async => await delete('episodes/$id');
}
