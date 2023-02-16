import 'package:flutter/material.dart';

var x = 0, y = 20, z = 50, v = 100, f = 200;

class MyButtonAddMony extends StatelessWidget {
  final String AddMony;
  final String price;

  const MyButtonAddMony({
    Key? key,
    required this.AddMony,
    required this.price,
    // required Null Function() onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => print(AddMony),
          // onTap: () {
          //   Navigator.pushNamed(context, AddMony);
          // },
          child: Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.symmetric(horizontal: 80),
            // padding: EdgeInsets.symmetric(horizontal: 60),
            width: 75,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.orange[400],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1),
              ],
            ),
            child: Text(
              price,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1),
            ),
          ),
        ),
      ],
    );
  }
}
