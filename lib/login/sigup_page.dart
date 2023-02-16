import 'package:appproject/data/profile.dart';
import 'package:appproject/data/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../home/home_page.dart';
import 'input_widget.dart';

class SigeUp extends StatefulWidget {
  const SigeUp({super.key});

  @override
  State<SigeUp> createState() => _SigeUpState();
}

class _SigeUpState extends State<SigeUp> {
  final fromKey = GlobalKey<FormState>();
  Profile profile = Profile(user: 'user', password: 'password', email: 'email');
  student myStudent =
      student(fname: 'fname', lname: 'lname', studentid: 'studentid');
  //เป็นการเตรียมFirebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
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
                          child: Text(
                            "สมัครสมาชิก",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Form(
                                    key: fromKey,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ชื่อ",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          TextFormField(
                                            validator: RequiredValidator(
                                                errorText: "กรุณากรอกชื่อ"),
                                            onSaved: (String? fname) {
                                              myStudent.fname = fname!;
                                            },
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            "นามสกุล",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          TextFormField(
                                            validator: RequiredValidator(
                                                errorText: "กรุณากรอกนามสกุล"),
                                            onSaved: (String? lname) {
                                              myStudent.lname = lname!;
                                            },
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            "อีเมล",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          TextFormField(
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText:
                                                      "กรุณากรอกอีเมลด้วยครับ"),
                                              EmailValidator(
                                                  errorText:
                                                      "รูปแบบอีเมลไม่ถูกต้อง"),
                                            ]),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onSaved: (String? email) {
                                              profile.email = email!;
                                            },
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            "รหัสผ่าน",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          TextFormField(
                                            validator: RequiredValidator(
                                                errorText:
                                                    "กรุณากรอกรหัสผ่านด้วยครับ"),
                                            obscureText: true,
                                            onSaved: (String? password) {
                                              profile.password = password!;
                                            },
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            "รหัสบัตรนักเรียน/นักศึกษา",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          TextFormField(
                                            validator: RequiredValidator(
                                                errorText:
                                                    "กรุณากรอกรหัสบัตรนักเรียน/นักศึกษาด้วยครับ"),
                                            onSaved: (String? studentid) {
                                              myStudent.studentid = studentid!;
                                            },
                                            keyboardType: TextInputType.number,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 350,
                                height: 50,
                                child: ElevatedButton(
                                  child: Text(
                                    "ลงทะเบียน",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    if (fromKey.currentState!.validate()) {
                                      fromKey.currentState?.save();
                                      // await _studentCollection.add({
                                      //   "fname": myStudent.fname,
                                      //   "lname": myStudent.lname,
                                      //   "studentid": myStudent.studentid
                                      // }); //การบันทึกชื่อนามสกุลและรหัสนักศึกษา
                                      try {
                                        FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: profile.email,
                                                password: profile.password)
                                            .then((value) {
                                          fromKey.currentState?.reset();
                                          Fluttertoast.showToast(
                                              msg: "สร้างบัญชีผู้ใช้เรียบร้อย",
                                              gravity: ToastGravity.TOP);
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return HomePage();
                                          }));
                                        });
                                      } on FirebaseAuthException catch (e) {
                                        print(e.code);
                                        // ignore: unused_local_variable
                                        String? message;
                                        if (e.code == 'email-already-in-use') {
                                          message =
                                              "มีอีเมลนี้ในระบบแล้ว โปรดใช้อีเมลอื่นแทน";
                                        } else if (e.code == 'weak-password') {
                                          message =
                                              "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                                        } else {
                                          message = e.message;
                                        }
                                        Fluttertoast.showToast(
                                            msg: '$message',
                                            gravity: ToastGravity.CENTER);
                                      }
                                    }
                                  },
                                ),
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
