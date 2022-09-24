// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:appproject/themes/color.dart';
import 'package:appproject/util/my_button.dart';
import 'package:appproject/util/my_card.dart';
import 'package:appproject/util/my_list_tile.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
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
                      ' Cards',
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

          Container(
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyCard(
                  balance: 5250.27,
                  cardNumber: 12345678,
                  expiryMonth: 26,
                  expiryYear: 03,
                  color: Color.fromARGB(255, 39, 38, 39),
                ),
                MyCard(
                  balance: 364.59,
                  cardNumber: 12345678,
                  expiryMonth: 12,
                  expiryYear: 09,
                  color: Color.fromARGB(255, 255, 88, 136),
                ),
                MyCard(
                  balance: 2487.67,
                  cardNumber: 12345678,
                  expiryMonth: 07,
                  expiryYear: 11,
                  color: Colors.orange[400],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          //ใส่สไลด์
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(),
          ),

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
                    Navigator.pushNamed(context, "/");
                  },
                  child: MyButton(
                    iconImagePath: 'images/pay.png',
                    buttonText: 'จ่าย',
                  ),
                ),

                ///ถอนเงิน
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/");
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
                    Navigator.pushNamed(context, "/");
                  },
                  child: MyListTile(
                    iconImagePath: 'images/graph.png',
                    tileTitle: 'ประวิติการใช้จ่าย',
                    tileSubTitle: 'ประวัติการใช้จ่ายเงิน',
                  ),
                ),
                //ยังไม่คิด

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                  },
                  child: MyListTile(
                    iconImagePath: 'images/bills.png',
                    tileTitle: 'ประวิติการใช้จ่าย',
                    tileSubTitle: 'ประวัติการใช้จ่ายเงิน',
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
