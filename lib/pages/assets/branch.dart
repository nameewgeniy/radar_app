import 'package:flutter/material.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/custom_drawer.dart';

class AssetsBranch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Отрасль активов"),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child:Padding(
                padding: const EdgeInsets.only(left: 0, top: 10),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                    ),
                  ],
                ))
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }

}