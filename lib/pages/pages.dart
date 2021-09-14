import 'package:get/get.dart';
import 'package:radar/bindings/assets.dart';
import 'package:radar/bindings/main.dart';
import 'package:radar/pages/assets/asset.dart';
import 'package:radar/pages/assets/assets.dart';
import 'package:radar/pages/assets/branch.dart';
import 'package:radar/pages/assets/type.dart';
import 'package:radar/pages/funds/fund.dart';
import 'package:radar/pages/funds/funds.dart';
import 'package:radar/pages/funds/select_funds.dart';
import 'package:radar/pages/home/home.dart';
import 'package:radar/routes/routes.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.initial, page: () => HomePage(), binding: HomeBinding()
    ),
    GetPage(
        name: Routes.assets,
        page: () => AssetsPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 1),
        binding: AssetsBinding()
    ),
    GetPage(
        name: Routes.funds,
        page: () => FundsPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 1),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.fund,
        page: () => FundPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.select_funds,
        page: () => SelectFundsPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.assets_type,
        page: () => AssetsType(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: AssetsBinding()
    ),
    GetPage(
        name: Routes.assets_branch,
        page: () => AssetsBranch(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: AssetsBinding()
    ),
    GetPage(
        name: Routes.asset,
        page: () => AssetPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: AssetsBinding()
    )
  ];
}
