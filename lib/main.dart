import 'package:flutter/material.dart';
import 'package:radar/models/data.dart';
import 'package:radar/pages/home/home.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Roboto",
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.amber,
          canvasColor: Colors.amber,
        ),
        initialRoute: "/",
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    );
  }
}
