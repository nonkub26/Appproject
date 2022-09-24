import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var darkColor = Color(0xFF475269);
var whiteColor = Color(0xFFFFFFFF);
var blueColor = Color.fromARGB(255, 72, 152, 218);

var boxDecoration = BoxDecoration(
  color: Color(0xFFF5F9FD),
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: darkColor.withOpacity(0.3),
      blurRadius: 5,
      spreadRadius: 1,
    ),
  ],
);
var drakBox = BoxDecoration(
  color: darkColor,
  borderRadius: BorderRadius.circular(10),
);
