import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gs_social/utils/route/route_name.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      SessionController().userId = user.uid.toString();
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(
              context, RoutesName.dashboardView));
    } else {
      Timer(const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, RoutesName.loginView));
    }
  }
}
