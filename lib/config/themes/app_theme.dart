import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      

      hintColor: AppColors.hintColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamily,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        color: Colors.transparent,
      ),
      textTheme: const TextTheme(
          titleSmall: TextStyle(
              height: 1.3,
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          )));
}
