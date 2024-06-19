import 'package:ballotchain/screens/splash_screen.dart';
import 'package:ballotchain/util/api_url.dart';
import 'package:ballotchain/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' BallotChain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),

      home: SplashScreen(),
    );
  }
}

