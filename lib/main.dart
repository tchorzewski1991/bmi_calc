import 'package:flutter/material.dart';
import 'package:bmi_calc/pages/home.dart';
import 'consts.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: scaffoldBackgroudColor,
        appBarTheme: AppBarTheme(color: appBarColor),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
