import 'package:appproject/data/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../home/home_page.dart';
import 'input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final fromKey = GlobalKey<FormState>();
  Profile profile = Profile(user: 'user', password: 'o', email: 'email');
  // final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // return FutureBuilder(
    //     future: firebase,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return Scaffold(
    //           appBar: AppBar(
    //             title: Text("Error"),
    //           ),
    //           body: Center(
    //             child: Text("${snapshot.error}"),
    //           ),
    //         );
    //       }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            height: h,
            width: w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/background02.png'),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    "images/logonvc (1).png",
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: fromKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "อีเมล",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                // color: Colors.white,
                              ),
                            ),
                            // TextFormField(
                            //   validator: MultiValidator([
                            //     RequiredValidator(
                            //         errorText: "กรุณากรอกอีเมลด้วยครับ"),
                            //     EmailValidator(
                            //         errorText: "รูปแบบอีเมลไม่ถูกต้อง"),
                            //   ]),
                            //   keyboardType: TextInputType.emailAddress,
                            //   onSaved: (String? email) {
                            //     profile.email = email!;
                            //   },
                            // ),
                            SizedBox(height: 15),
                            Text(
                              "รหัสผ่าน",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                // color: Colors.white,
                              ),
                            ),
                            // TextFormField(
                            //   validator: RequiredValidator(
                            //       errorText: "กรุณากรอกรหัสผ่านด้วยครับ"),
                            //   obscureText: true,
                            //   onSaved: (String? password) {
                            //     profile.password = password!;
                            //   },
                            // ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            "เข้าสู่ระบบ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 350,
                      //   height: 50,
                      //   child: ElevatedButton(
                      //     child: Text(
                      //       "เข้าสู่ระบบ",
                      //       style: TextStyle(fontSize: 20),
                      //     ),
                      //     onPressed: () async {
                      //       if (fromKey.currentState!.validate()) {
                      //         fromKey.currentState?.save();
                      //         try {
                      //           await FirebaseAuth.instance
                      //               .signInWithEmailAndPassword(
                      //                   email: profile.email,
                      //                   password: profile.password)
                      //               .then((value) {
                      //             fromKey.currentState?.reset();
                      //             Navigator.pushReplacement(context,
                      //                 MaterialPageRoute(builder: (context) {
                      //               return HomePage();
                      //             }));
                      //           });
                      //         } on FirebaseAuthException catch (e) {
                      //           print(e.code);
                      //           // ignore: unused_local_variable
                      //           String? message;
                      //           if (e.code == 'user-not-found') {
                      //             message = "อีเมลนี้ยังไม่ได้มีการลงทะเบียน";
                      //           } else if (e.code == 'wrong-password') {
                      //             message =
                      //                 "รหัสผ่านไม่ถูกต้อง กรุณากรอกรหัสใหม่อีกครั้ง";
                      //           } else {
                      //             message = e.message;
                      //           }
                      //           Fluttertoast.showToast(
                      //               msg: '$message',
                      //               gravity: ToastGravity.CENTER);
                      //         }
                      //       }
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          //   "สำหรับร้านอาหารวิทยาลัยอาชีวศึกษา",
                          //   style: TextStyle(
                          //     color: Color(0xFF475269).withOpacity(0.8),
                          //     fontSize: 16,
                          //   ),
                          // ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "sigeUp");
                            },
                            child: Text(
                              "ลงทะเบียนการสมัครสมาชิกเข้าใช้งาน",
                              style: TextStyle(
                                  color: Color(0xFF475269),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //);
}
//}
