import 'package:flutter/material.dart';
import 'package:gallary_app/appTheme.dart';
import 'package:gallary_app/routes.dart';
import 'package:gallary_app/sizeConfig.dart';
import 'package:gallary_app/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movies',
              theme: AppTheme.appTheme,
              home: SplashScreen(),
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          },
        );
      },
    );
  }
}
