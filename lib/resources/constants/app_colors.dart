import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Colors.yellow[700]!;
  static const Color secondaryColor = Colors.black;
  static const Color white = Colors.white;
  static const Color lightGrey = Color.fromARGB(255, 192, 191, 191);
  static const Color cardLightColor = Color.fromARGB(255, 233, 232, 232);
  static LinearGradient yellowGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Colors.white,
        const Color.fromARGB(255, 235, 234, 234),
        Colors.amber.shade100
      ]);
}
