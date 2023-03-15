import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String textHint;
  final IconData icon;
  const InputWidget({
    Key? key,
    required this.textHint,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: Color(0xFF475269),
          ),
          //SizedBox(width: 10), เป็นการเพิ่มกล่องว่างๆเพื่อเว้นระยะห่าง
          Container(
            margin: EdgeInsets.only(
                left: 10), // เป็นการเพิ่มกล่องว่างๆเพื่อเว้นระยะห่าง
            width: 200,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: textHint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
