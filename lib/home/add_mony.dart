// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../themes/color.dart';
import '../util/my_card.dart';

class MyAddMony extends StatefulWidget {
  const MyAddMony({super.key});

  @override
  State<MyAddMony> createState() => _MyAddMonyState();
}

final _controller = PageController();

class _MyAddMonyState extends State<MyAddMony> {
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
                  Navigator.pushNamed(context, "homePage");
                },
                icon: Icon(
                  Icons.home,
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
        child: Column(
          children: [
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
                        'เติมเงิน',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
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
            )
          ],
        ),
      ),
    );
  }
}
