import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 0, 152, 255);
  static const Color primaryColorShade = Color.fromARGB(255, 0, 83, 138);
  static const Color secondaryColor = Color.fromARGB(255, 30, 30, 30);
  static const Color backgroundColor = Color.fromARGB(255, 0, 0, 0);
  static const Color textColor = Color.fromARGB(255, 255, 255, 255);
  static const Color hinttextColor = Color.fromARGB(255, 201, 201, 201);
  static const Color borderColor = Color.fromARGB(147, 240, 240, 240);
  static const Color errorColor = Color(0xFFB00020);
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
}
