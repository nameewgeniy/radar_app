import 'package:get/get.dart';
import 'package:radar/pages/assets/assets.dart';
import 'package:radar/pages/home/home.dart';
import 'package:radar/routes/routes.dart';

class Pages {

  static List<GetPage> pages = [

    GetPage(
    name: Routes.initial,
    page: () => HomePage(),
    ),

    GetPage(
      name: Routes.assets,
      page: () => AssetsPage(),
      transition: Transition.noTransition,
      transitionDuration: Duration(milliseconds: 1),
    )
  ];

}