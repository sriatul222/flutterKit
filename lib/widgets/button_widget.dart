import 'package:club/extra/colors.dart';
import 'package:club/extra/common_style.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final dynamic onTap;

  const ButtonWidget(
      {super.key, required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: MyColor.buttonColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: MyColor.buttonColor),
        child: Text(
          buttonName,
          style: textStyleBold.copyWith(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
