import 'package:flutter/material.dart';
import 'package:gs_social/view/login/login_view.dart';
import 'package:gs_social/view/signup/signup_view.dart';
import 'package:gs_social/view/splash/splash_view.dart';
import 'package:gs_social/utils/route/route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutesName.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesName.signUpView:
        return MaterialPageRoute(builder: (_) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
