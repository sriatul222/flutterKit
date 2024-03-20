import 'package:flutter/material.dart';

TextStyle textStyleBold = const TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 15);

TextStyle textStyleNormal = const TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 15);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  borderSide: BorderSide(color: Colors.grey, width: 1),
);

OutlineInputBorder outlineInputBorderRed = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  borderSide: BorderSide(color: Colors.red, width: 1),
);
