import 'package:flutter/material.dart';

var kblack = Colors.black;
var kwhite = Colors.white;
var kred = Colors.red;
var kgreen = Colors.green;

textStyleFuc({required weight, required color, required double size}) {
  return TextStyle(fontSize: size, fontWeight: weight, color: color);
}

///height
///
var commonHeight = const SizedBox(
  height: 20,
);
var height10 = const SizedBox(
  height: 10,
);

// radius

var radiusTen = BorderRadius.circular(11);
