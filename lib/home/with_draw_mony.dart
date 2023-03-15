import 'package:appproject/data/amount.dart';
import 'package:appproject/home/add_money_button.dart';
import 'package:appproject/model/user.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/otherconstant.dart';
import '../login/input_widget.dart';
import '../services/user.service.dart';
import '../themes/color.dart';
import '../util/my_button-add-mony.dart';
import '../util/my_card.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class MyWithDrawMony extends StatefulWidget {
  const MyWithDrawMony({super.key});

  @override
  State<MyWithDrawMony> createState() => _MyWithDrawMonyState();
}

final _controller = PageController();
Amount amount = Amount(money: 'money');

class _MyWithDrawMonyState extends State<MyWithDrawMony> {
  int _counter = 0;
  late Future<User> currentUser;

  void _incrementCounter(int amount) {
    print("aaaaa " + amount.toString());
    setState(() {
      _counter = _counter + amount; // รอแก้
    });
  }

  incrementAmount(int amount) {
    print("Amount $amount");
    setState(() {
      _counter += amount;
    });
  }

  void clearAmount() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser = UserService().getUser(id);
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
      body: Container(
        padding: const EdgeInsets.only(top: 0, left: 5, right: 0),
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
                            'ถอนเงิน',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 370,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ยอดถอนเงิน',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Image.asset(
                                        "images/logonvc (1).png",
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '          \฿  ' + _counter.toString(),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ยอดเงิน'.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '   ${snapshot.data!.balance}  บาท',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        }),
                  ),
                ),

                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'จำนวนเงิน',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddMoneyButton(
                        amount: 20,
                        onTap: incrementAmount,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AddMoneyButton(
                        amount: 50,
                        onTap: incrementAmount,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AddMoneyButton(
                        amount: 100,
                        onTap: incrementAmount,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AddMoneyButton(
                        amount: 200,
                        onTap: incrementAmount,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputWidget(
                        textHint: "กรอกจำนวนเงิน",
                        icon: Icons.monetization_on,
                      ),
                      SizedBox(height: 45),
                      InkWell(
                        onTap: () {
                          UserService().withdraw(id, _counter);
                          Navigator.pushNamed(context, "homePage");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color(0xFF475269),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF475269).withOpacity(0.3),
                                  blurRadius: 5,
                                  spreadRadius: 1),
                            ],
                          ),
                          child: Text(
                            "ยืนยันการถอนเงิน",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
