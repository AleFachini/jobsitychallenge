import 'package:get/get.dart';

import 'package:jobsitychallenge/app/modules/search/search_model.dart';

class SearchProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Search.fromJson(map);
    httpClient.baseUrl = 'http://api.tvmaze.com/';
  }

  Future<Response<List<dynamic>>> getSearch(String query) async =>
      await get('http://api.tvmaze.com/search/shows?q=$query');
  Future<Response<Search>> postSearch(Search search) async =>
      await post('search', search);
  Future<Response> deleteSearch(int id) async => await delete('search/$id');
}
