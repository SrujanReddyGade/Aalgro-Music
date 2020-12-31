import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/PlayGround/Flutter/Flutter_Samples/alg_music/flutter_app/lib/ui/HomeScreenView.dart';
import 'package:flutter_app/utils/AppContstants.dart';
import 'package:flutter/services.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstants.appName,
        theme: ThemeData(
            primarySwatch: AppConstants.createMaterialColor(Color(0xFF2a2d36)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor:
                AppConstants.createMaterialColor(Color(0xFF2a2d36))),
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreenView())));
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
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
              child: Image.asset('assets/app_icon.png',
                  width: 200, height: 200),
            ),
            opacity: 1.0,
            duration: Duration(milliseconds: 500),
          ),
          SizedBox(height: 20),
          Text(AppConstants.appName,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                fontSize: 15.0,
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
              textAlign: TextAlign.center),
        ],
      ),
    ));
  }
}
