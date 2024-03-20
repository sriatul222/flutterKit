import 'package:club/extra/colors.dart';
import 'package:flutter/material.dart';

void deleteAccountDialog(BuildContext con, stringText) {
  showDialog(
      context: con,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: Text(stringText,
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                    fontSize: 18)),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: const BorderSide(color: MyColor.black)),
                child: const Text("No"),
                onPressed: () {
                  Navigator.pop(con);
                },
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: MyColor.black)),
                  child: const Text("Yes"),
                  onPressed: () {
                    Navigator.pop(con);
                  }),
            ],
          ));
}
