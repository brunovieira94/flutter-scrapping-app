import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'login_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Scaffold(
    body: AnimatedSplashScreen(
      duration: 3000,
      splash: Image.asset(
        'assets/images/Logo.png',
      ),
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Color.fromRGBO(46, 55, 70, 1),
    ),
  );
}
