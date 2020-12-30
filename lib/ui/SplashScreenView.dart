import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/PlayGround/Flutter/Flutter_Samples/alg_music/flutter_app/lib/ui/HomeScreenView.dart';
import 'package:flutter_app/utils/AppContstants.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstants.appName,
        theme: ThemeData(
          primarySwatch: AppConstants.appThemeColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MySplashPage(),
        debugShowCheckedModeBanner: false);
  }
}

class MySplashPage extends StatefulWidget {
  @override
  _MySplashPage createState() => _MySplashPage();
}

class _MySplashPage extends State<MySplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreenView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
            child: Container(
              width: 200,
              height: 200,
              child: Image.network(AppConstants.splashScreenImageUrl,
                  width: 200, height: 200),
            ),
            opacity: 1.0,
            duration: Duration(milliseconds: 500),
          ),
          SizedBox(height: 20),
          Text(AppConstants.appName)
        ],
      ),
    ));
  }
}
