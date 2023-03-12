import 'package:flutter/material.dart';

const Duration splashScreenDuration = Duration(seconds: 3);

class ColorStyles {
  static const canvasColor = Color(0xFFFFFFFF);
  static const primaryColor = Color(0xFF282828);
  static const secondColor = Color(0xFF8C8C8C);
  static const darkenedTextColor = Color(0xFF595858);
  static const darkenedBackgroundColor = Color(0xFFF6F6F6);
}

class TextStyles {
  static const montserratBold =
  TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold);
  static const montserratMedium =
      TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500);
  static const montserratSemiBold =
      TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600);
  static const mulishBold =
      TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.bold);
  static const mulishSemiBold =
      TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.w600);
}
