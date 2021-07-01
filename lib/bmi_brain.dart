import 'dart:math';

import 'package:flutter/cupertino.dart';

class BMIBrain {
  BMIBrain({@required this.weight, @required this.height});

  int height;
  int weight;
  double _bmi;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getCategory() {
    if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getDescription() {
    if (_bmi > 25) {
      return 'You BMI is little high. Let\'s do some excercise';
    } else if (_bmi > 18.5) {
      return 'Your BMI is really good. Keep it up!';
    } else {
      return 'You BMI is little low. Just eat some food!';
    }
  }
}
