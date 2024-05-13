import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gs_social/utils/route/route_name.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, RoutesName.loginView));
  }
}
