import 'package:flutter/material.dart';
import 'file:///D:/PlayGround/Flutter/Flutter_Samples/alg_music/flutter_app/lib/ui/SplashScreenView.dart';
import 'package:flutter_app/utils/AppContstants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        primarySwatch: AppConstants.appThemeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
