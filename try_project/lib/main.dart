import 'package:flutter/material.dart';
import 'package:try_project/details.dart';
import 'package:try_project/splashScreen.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'home': (context) => Home(),
        'details': (context) => ItemDetails(),
        'splashScreen': (context) => SplashScreen(),
      },
    );
  }
}
