import 'package:appproject/constants/otherconstant.dart';
import 'package:appproject/model/transaction.dart';
import 'package:appproject/model/user.dart';
import 'package:appproject/services/user.service.dart';
import 'package:appproject/util/my_history.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../themes/color.dart';

class MyPayHistory extends StatefulWidget {
  const MyPayHistory({super.key});

  @override
  State<MyPayHistory> createState() => _MyPayHistoryState();
}

class _MyPayHistoryState extends State<MyPayHistory> {
  late Future<List<Transaction>> transactions;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactions = UserService().getTransactionHistory(id);
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
        padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
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
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ประวัติการจ่ายเงิน',
                            style: TextStyle(
                              fontSize: 30,
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

                SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FutureBuilder(
                        future: transactions,
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "payment");
                                  },
                                  child: MyHistory(
                                    Operation: snapshot.data![index].operation,
                                    NameHistory: snapshot.data![index].reference,
                                    TextID: snapshot.data![index].userId,
                                    TextDay: snapshot.data![index].createdAt.toString(),
                                    Price: snapshot.data![index].amount.toString(),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        }),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
