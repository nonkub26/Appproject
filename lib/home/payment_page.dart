import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/background01.png'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: h * 0.14,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('images/success.png'),
                  ),
                ),
              ),
              Text(
                " สำเร็จ !",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                " คุณได้ดำเนินการจ่ายสำเร็จ",
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 118, 118, 118),
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 15,
                              left: 20,
                            ),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green,
                            ),
                            child: Icon(
                              Icons.done,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " ร้านป้าไข่ไก่ทอด",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                " ID:1654684123",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text(
                                " ", //เว้นวรรค
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                " ฿ 45.00",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              Column(
                children: [
                  Text(
                    "ยอดเงินสุทธิ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 118, 118, 118),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "45.00 บาท",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 130),
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
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        " share",
                        style: TextStyle(
                          fontSize: 18,
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
                          Icons.print,
                          size: 40,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        " Print",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "payhistory");
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
    );
  }
}
