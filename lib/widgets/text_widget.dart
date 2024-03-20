import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  final String text;
  final String font;
  final double size;
  final Color color;
  final FontWeight weight;

  const GreyText({super.key, required this.text,required this.font,required this.size,required this.color,required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.start,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: color,
            fontFamily: font,
            fontWeight: weight,
            fontSize: size));
  }
}