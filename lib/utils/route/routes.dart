import 'package:flutter/material.dart';
import 'package:gs_social/model_view/splash/splash_view.dart';
import 'package:gs_social/utils/route/route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());

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
