import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppFontStyle {
  static TextStyle normalBold = const TextStyle(fontWeight: FontWeight.bold);
  static TextStyle normalBoldRed =
      const TextStyle(fontWeight: FontWeight.bold, color: AppColors.red);
  static TextStyle font18Bold =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  static const TextStyle normalBoldWhite =
      TextStyle(color: AppColors.white, fontWeight: FontWeight.bold);
}
