import 'package:app_scrapper/splash.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'splash.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {'/': (context) => LoginPage(), '/home': (context) => HomePage(), '/splash': (context) => MyHomePage()},
    );
  }
}
