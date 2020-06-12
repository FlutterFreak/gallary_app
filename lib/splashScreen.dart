import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gallary_app/appTheme.dart';
import 'package:gallary_app/home.dart';
import 'package:gallary_app/sizeConfig.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: AppTheme.primaryColor,
          child: new Image.asset(
            'assets/art.png',
            // color: AppTheme.primaryColor,
            height: 20 * SizeConfig.imageSizeMultiplier,
            width: 20 * SizeConfig.imageSizeMultiplier,
          ),
        ),
      ),
    );
  }
}
