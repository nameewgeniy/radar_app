import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Data with ChangeNotifier {

  final TextEditingController controllerCreateTitle = TextEditingController();
  final TextEditingController controllerUpdateTitle = TextEditingController();

  static const Color firstColor = Color.fromARGB(255, 26, 81, 230);
  static const Color secondColor = Color.fromARGB(200, 61, 113, 241);

  bool isHiddenFields = true;
  String currentRoute = '/';

  List<Map> navigationItems = <Map>[
    {
      "icon": MaterialCommunityIcons.home_variant,
      "label": "Home",
      "route": "/"
    },
    {
      "icon": MaterialCommunityIcons.account_outline,
      "label": "Profile",
      "route": "/profile"
    },
  ];

  Data() {
  }

  void changePage(context, String route) {
    print(route);
    Navigator.pushReplacementNamed(context, route);

    currentRoute = route;
    notifyListeners();
  }
}
