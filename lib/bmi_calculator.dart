import 'package:flutter/material.dart';
import 'dart:math';

class BMIClassification {
  final String name;
  final String interpretation;
  final bool Function(double) condition;

  BMIClassification({this.name, this.interpretation, this.condition});
}

class BMICalculator {
  final double height;
  final int weight;
  final int age;

  double _bmi;
  BMIClassification _bmiClassification;

  List<BMIClassification> _bmiClassifications = [
    BMIClassification(
      name: 'Starvation',
      interpretation: 'Huston, we\'ve got a serious problem!',
      condition: (double bmi) {
        return bmi < 16.0;
      },
    ),
    BMIClassification(
      name: 'Emaciation',
      interpretation: 'You need to start eat more. Health degradation is close',
      condition: (double bmi) {
        return bmi >= 16.0 && bmi < 17.00;
      },
    ),
    BMIClassification(
      name: 'Underweight',
      interpretation: 'It\'s not bad, but consider to eat more.',
      condition: (double bmi) {
        return bmi >= 17.0 && bmi < 18.50;
      },
    ),
    BMIClassification(
      name: 'Perfect',
      interpretation: 'Well done! You are fit :)',
      condition: (double bmi) {
        return bmi >= 18.5 && bmi < 25.0;
      },
    ),
    BMIClassification(
      name: 'Overweight',
      interpretation: 'Keep calm and observe your weight. Danger zone.',
      condition: (double bmi) {
        return bmi >= 25.0 && bmi < 30.0;
      },
    ),
    BMIClassification(
      name: 'Obesity I',
      interpretation: 'You should consider to eat less.',
      condition: (double bmi) {
        return bmi >= 30.0 && bmi < 35.0;
      },
    ),
    BMIClassification(
      name: 'Obesity II',
      interpretation: 'You have a problem. Observe your health carefoully.',
      condition: (double bmi) {
        return bmi >= 35.0 && bmi < 40.0;
      },
    ),
    BMIClassification(
      name: 'Obesity III',
      interpretation: 'End is near. It was pleasure to meet you.',
      condition: (double bmi) {
        return bmi >= 40.0;
      },
    ),
  ];

  BMICalculator({
    @required this.weight,
    @required this.height,
    @required this.age,
  });

  void calculateResult() {
    _bmi = weight / pow(height / 100, 2);
    _bmiClassification = _bmiClassifications.firstWhere(
      (classification) => classification.condition(_bmi),
    );
  }

  String getVerdict() {
    return _bmiClassification.name;
  }

  String getScore() {
    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation() {
    return _bmiClassification.interpretation;
  }
}
