import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  final int amount;
  final ValueChanged<int> onTap;
  const AddMoneyButton({Key? key, required this.amount, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(amount);
        onTap(amount);
      },
      // onTap: () {
      //   Navigator.pushNamed(context, AddMony);
      // },
      child: Container(
        alignment: Alignment.center,
        // margin: EdgeInsets.symmetric(horizontal: 80),
        // padding: EdgeInsets.symmetric(horizontal: 60),
        width: 67,
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
          amount.toString(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
      ),
    );
  }
}
