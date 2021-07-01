import 'package:bmi_calculater_my/screen1.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'homescreen.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kBackgroundColor,
        accentColor: kActiveColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: HomeScreen(),
    );
  }
}
