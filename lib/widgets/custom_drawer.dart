
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radar/enum/enum.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          SizedBox(
            height : 90.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Enum.firstColor,
              ),
              child: Text(
                'Меню',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
          ),
        ],
      ),
    );
  }
}