// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:appproject/model/user.dart';
import 'package:appproject/service/api.dart';
import 'package:appproject/themes/color.dart';
import 'package:appproject/util/my_button.dart';
import 'package:appproject/util/my_card.dart';
import 'package:appproject/util/my_list_tile.dart';
import 'package:badges/badges.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Future<User> getUser() async {
  var id = "63ee40e5ff687ceebb9eb59c";
  var response = API().getCurrentUser(id);
  return User.fromJson(jsonDecode(response.data));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  final _controller = PageController();
  //final auth = FirebaseAuth.instanceFor;

  late Future<User> currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser = getUser();
    print("5555555");
    print(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blueColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "homePage");
        },
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                icon: Icon(
                  Icons.logout,
                  size: 33,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                icon: Icon(
                  Icons.settings,
                  size: 33,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/background02.png'),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 25),
              // appbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'My',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Card',
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),

                    //plus buttom
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: boxDecoration,
                      child: Badge(
                        badgeColor: Colors.redAccent,
                        padding: EdgeInsets.all(7),
                        badgeContent: Text(
                          "3",
                          style: TextStyle(color: whiteColor),
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                          color: darkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: 370,
                  height: 200,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 39, 38, 39),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: FutureBuilder<User>(
                    future: currentUser,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ยอดเงิน',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                Image.asset(
                                  'images/visa.png',
                                  height: 50,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text(
                                '  \$  ' + _counter.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  123456.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  26.toString() + '/' + 03.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              SizedBox(height: 35),
              //ใส่สไลด์
              // SmoothPageIndicator(
              //   controller: _controller,
              //   count: 3,
              //   effect: ExpandingDotsEffect(),
              // ),

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///เติมเงิน
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "addmony");
                      },
                      child: MyButton(
                        iconImagePath: 'images/addmony.png',
                        buttonText: 'เติมเงิน',
                      ),
                    ),

                    ///จ่ายเงิน
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "paymony");
                      },
                      child: MyButton(
                        iconImagePath: 'images/pay.png',
                        buttonText: 'จ่าย',
                      ),
                    ),

                    ///ถอนเงิน
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "withdrawmony");
                      },
                      child: MyButton(
                        iconImagePath: 'images/send.png',
                        buttonText: 'ถอนเงิน',
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    //ประวัติการใช้จ่าย
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "payhistory");
                      },
                      child: MyListTile(
                        iconImagePath: 'images/bills.png',
                        tileTitle: 'ประวัติ',
                        tileSubTitle: 'ประวัติการใช้จ่ายเงิน',
                      ),
                    ),
                    //ยังไม่คิด

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "myqrcode");
                      },
                      child: MyListTile(
                        iconImagePath: 'images/scanme.png',
                        tileTitle: 'คิวอาร์โค๊ดของฉัน',
                        tileSubTitle: 'QR Code เพื่อรับเงิน',
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
