// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 238, 153, 74);
  static const Color secondaryColor = Color.fromRGBO(150, 130, 29, 1);

  static const Color primaryTextTextColor = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryTextColor = Color.fromARGB(255, 0, 0, 0);

  static const Color primaryIconColor = Color.fromARGB(255, 13, 13, 13);
  static const Color iconBackgroundColor = Color(0xffdfdfe1);

  static const Color successColor = Color.fromARGB(255, 4, 151, 205);

  static const Color inputTextBorderColor = Color.fromRGBO(150, 130, 29, 1);
  static const Color hintColor = Color.fromRGBO(114, 114, 114, 1);

  static const Color textFieldDefaultFocus = Color(0xfff5f5f6);
  static const Color textFieldDefaultBorderColor = Color(0xfffDFDFE1);
  static const Color textFieldFocusBorderColor =
      Color.fromRGBO(150, 130, 29, 1);

  static const Color alertColor = Color(0xffff0222);

  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Color(0x00000000);
  static const Color grayColor = Color(0xffdfdfe1);

  static const Color focusUnderLineColor = Color(0xff373737);
  static const Color dividedColor = Color(0xff373737);

  static const Color dialogAlertBackgroundColor = Color(0xff262938);
  static const Color lightGrayColor = Color(0xffA5A5A5);

  //otp screen changing color
  static const Color otpBorderColor = Color.fromRGBO(34, 34, 34, 0.1);
  static const Color otpFocusColor = Color.fromRGBO(150, 130, 29, 1);
  static const Color otpBackgroundColor = Color(0xffff5f5f6);
  static const Color otpHintColor = Color.fromRGBO(170, 170, 170, 1);

  static const MaterialColor primaryMaterialColor = MaterialColor(
    0xfff59e4a, // Orange color value
    <int, Color>{
      50: Color(0xfffff3e4), // Light shade
      100: Color(0xffffe2c4),
      200: Color(0xffffd0a5),
      300: Color(0xffffbf85),
      400: Color(0xffffae65),
      500: Color(0xfff59e4a), // Main shade
      600: Color(0xffe68b3e),
      700: Color(0xffd17933),
      800: Color(0xffbb6628),
      900: Color(0xffa4541e), // Dark shade
    },
  );
}
