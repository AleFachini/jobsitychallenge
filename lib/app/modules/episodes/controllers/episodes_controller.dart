import 'package:get/get.dart';
import 'package:jobsitychallenge/app/data/episode_details.dart';
import 'package:jobsitychallenge/app/modules/episodes/providers/episodes_provider.dart';

class EpisodesController extends GetxController
    with StateMixin<Response<List<dynamic>>> {
  final episodeDetails = Rx<EpisodeDetails>();
  @override
  void onInit() {}
  @override
  void onReady() {}
  @override
  void onClose() {}

  void getEpisodes(int seasonId) {
    EpisodesProvider().getEpisodes(seasonId).then((resp) {
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

  void setEpisodeDetails(
      String name, int season, int number, String image, String summary) {
    episodeDetails.value = EpisodeDetails(
      name: name,
      season: season,
      chapternumber: number,
      imageUrl: image,
      summary: summary,
    );
    return;
  }
}
