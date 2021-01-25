import 'package:get/get.dart';

import 'package:jobsitychallenge/app/modules/episodes/bindings/episodes_binding.dart';
import 'package:jobsitychallenge/app/modules/episodes/views/episodes_view.dart';
import 'package:jobsitychallenge/app/modules/home/bindings/home_binding.dart';
import 'package:jobsitychallenge/app/modules/home/bindings/seasons_binding.dart';
import 'package:jobsitychallenge/app/modules/home/views/details_view.dart';
import 'package:jobsitychallenge/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsPage(),
      binding: SeasonsBinding(),
    ),
    GetPage(
      name: _Paths.EPISODES,
      page: () => EpisodesView(),
      binding: EpisodesBinding(),
    ),
  ];
}
