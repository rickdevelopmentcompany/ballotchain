import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:ballotchain/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF081B2D),
      ),
      body: FlutterSplashScreen.gif(
        gifPath: 'assets/images/splash.png',
        backgroundColor: Color(0XFF081B2D),
        gifWidth: 269,
        gifHeight: 474,
        nextScreen: DashboardScreen(),
        duration: const Duration(milliseconds: 1500),
        onInit: () async {
          debugPrint("onInit");
        },
        onEnd: () async {
          debugPrint("onEnd 1");
        },
      ),
    );
  }
}