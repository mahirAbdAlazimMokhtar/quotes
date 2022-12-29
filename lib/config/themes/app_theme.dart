import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamily,
      textTheme: const TextTheme(
          button: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      )));
}
