import 'package:appproject/themes/color.dart';
import 'package:flutter/material.dart';

import 'home/add_mony.dart';
import 'home/home_page.dart';
import 'login/login_page.dart';
import 'login/sigup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: blueColor,
      ),
      routes: {
        "/": (context) => LoginPage(),
        "homePage": (context) => HomePage(),
        "sigeUp": (context) => SigeUp(),
        "addmony": (context) => MyAddMony(),
        // "itemPage": (context) => ItemPage(),
      },
    );
  }
}
