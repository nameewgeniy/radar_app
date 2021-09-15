import 'package:get/get.dart';
import 'package:radar/bindings/assets.dart';
import 'package:radar/bindings/main.dart';
import 'package:radar/screens/assets/asset.dart';
import 'package:radar/screens/assets/assets.dart';
import 'package:radar/screens/fund/fund.dart';
import 'package:radar/screens/fund/fund_type_assets.dart';
import 'package:radar/screens/fund/fund_type_branch.dart';
import 'package:radar/screens/funds/funds.dart';
import 'package:radar/screens/funds/funds_type_assets.dart';
import 'package:radar/screens/funds/funds_type_branch.dart';
import 'package:radar/screens/funds/select_funds.dart';
import 'package:radar/screens/home/home.dart';
import 'package:radar/routes/routes.dart';

class Screens {
  static List<GetPage> screens = [
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
        name: Routes.fund_type_assets,
        page: () => FundTypeAssetsPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.fund_type_branch,
        page: () => FundTypeBranchPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.funds_type_assets,
        page: () => FundsTypeAssetsPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: HomeBinding() //AssetsBinding()
    ),
    GetPage(
        name: Routes.funds_type_branch,
        page: () => FundsTypeBranchPage(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 10),
        binding: HomeBinding() //AssetsBinding()
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
