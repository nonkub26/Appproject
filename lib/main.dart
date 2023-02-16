import 'package:appproject/home/pay_money.dart';
import 'package:appproject/themes/color.dart';
import 'package:flutter/material.dart';

import 'home/add_money.dart';
import 'home/home_page.dart';
import 'home/pay_history.dart';
import 'home/payment_page.dart';
import 'home/qr_code.dart';
import 'home/with_draw_mony.dart';
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
      // theme: ThemeData(
      //   scaffoldBackgroundColor: blueColor,
      // ),
      routes: {
        "/": (context) => LoginPage(),
        "homePage": (context) => HomePage(),
        "sigeUp": (context) => SigeUp(),
        "addmony": (context) => MyAddMony(),
        "paymony": (context) => MyPayMony(),
        "payhistory": (context) => MyPayHistory(),
        "withdrawmony": (context) => MyWithDrawMony(),
        "payment": (context) => PaymentPage(),
        "myqrcode": (context) => MyQrCode(),
        // "itemPage": (context) => ItemPage(),
      },
    );
  }
}
