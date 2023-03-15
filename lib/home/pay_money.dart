import 'package:appproject/constants/otherconstant.dart';
import 'package:appproject/data/amount.dart';
import 'package:appproject/home/add_money.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../login/input_widget.dart';
import '../services/user.service.dart';
import '../themes/color.dart';

class MyPayMony extends StatefulWidget {
  const MyPayMony({super.key});

  @override
  State<MyPayMony> createState() => _MyPayMonyState();
}

class _MyPayMonyState extends State<MyPayMony> {
  int _counter = 0;
  TextEditingController amountController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amountController.dispose();
    super.dispose();
  }

  void clearAmount() {
    setState(() {
      _counter = 0;
    });
  }

  final fromKey = GlobalKey<FormState>();
  String scanresult="";
  String result = "กรุณาสแกน QR CODE";
  bool checkLLineURL = true;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blueColor,
      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
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
            child: Column(
              children: [
                SizedBox(height: 25),
                // appbar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'จ่าย',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      //plus buttom
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "สแกนจ่าย",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                result,
                                style: TextStyle(fontSize: 20),
                              ),
                              // Spacer(),
                              // checkLLineURL
                              //     ? SizedBox(
                              //         width: double.infinity,
                              //         child: RaisedButton(
                              //           onPressed: () {},
                              //           color: Colors.green[900],
                              //           child: Text(
                              //             "เข้าระบบผ่าน Line",
                              //             style:
                              //                 TextStyle(color: Colors.white),
                              //           ),
                              //         ),
                              //       ):
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 10),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "กรอกจำนวนเงิน",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        // InputWidget(
                        //   textHint: "กรอกจำนวนเงิน",
                        //   icon: Icons.monetization_on,
                        // ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F9FD),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF475269).withOpacity(0.5),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                          ),
                        ),
                        SizedBox(height: 45),
                        InkWell(
                          onTap: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return AlertDialog(
                            //       // Retrieve the text the that user has entered by using the
                            //       // TextEditingController.
                            //       content: Text(amountController.text),
                            //     );
                            //   },
                            // );
                            int amountToPay = int.parse(amountController.text);
                            print(scanresult);
                            UserService().buy(id, scanresult, amountToPay);
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
                              "ยืนยันการชำระเงิน",
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  startScan() async {
    //อ่านข้อมูลจากการสแกน QR Code
    String cameraScanResult = await scanner.scan() as String;
    setState(() {
      //id ของร้าน
      scanresult = cameraScanResult;

      result = "รหัสร้าน: $scanresult \n ชื่อร้าน: เจ๊ไฝ";

      print(result);
    });
    if (scanresult!.contains("line.me")) {
      checkLLineURL = true;
    }
  }
}

// RaisedButton(
//     {required Null Function() onPressed, Color? color, required Text child}) {}
