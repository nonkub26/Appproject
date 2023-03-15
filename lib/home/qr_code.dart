import 'package:appproject/constants/otherconstant.dart';
import 'package:appproject/model/user.dart';
import 'package:appproject/services/user.service.dart';
import 'package:appproject/themes/color.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class MyQrCode extends StatefulWidget {
  const MyQrCode({super.key});

  @override
  State<MyQrCode> createState() => _MyQrCodeState();
}

class _MyQrCodeState extends State<MyQrCode> {
  final _controller = PageController();
  late Future<User> currentUser;

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
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
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
                SizedBox(height: 15),
                // appbar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'คิวอาร์โค๊ดของฉัน',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                FutureBuilder<User>(
                    future: currentUser,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/myqr01.png",
                              height: 250,
                              width: 250,
                            ),
                            SizedBox(height: 25),
                            Text(
                              "สแกน QR Code เพื่อโอนเข้าบัญชี",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 196, 0),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'ชื่อ  ${snapshot.data!.name}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'เลขที่อ้างอิง  ${snapshot.data!.id}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "homePage");
                          },
                          icon: Icon(
                            Icons.share_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          " share",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),
                    // Icon:Icons.share_sharp, onTap:(){},text:"แชร์",

                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "homePage");
                          },
                          icon: Icon(
                            Icons.save,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          " Save",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                InkWell(
                  onTap: () {
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
                      "ย้อนกลับ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
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
}
