import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/details.dart';
import 'package:gallary_app/home.dart';
import 'package:gallary_app/splashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.imageDetails:
        return MaterialPageRoute(
            builder: (_) => FullImage(
                  img: args,
                ));
      default:
        return _homeRoute();
    }
  }

  static Route<dynamic> _homeRoute() {
    return MaterialPageRoute(builder: (_) {
      return MyHomePage();
    });
  }
}

class AppRoutes {
  static const String imageDetails = 'imageDetails';
  static const String splashScreen = 'splashScreen';
}
