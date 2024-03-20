import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog extends StatelessWidget {
  final String title;

  const PermissionDialog({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () async {
            // Navigator.pop(context);
            openAppSettings();
            Navigator.pop(context);

            // await Permission.o
          },
        ),
      ],
    );
  }
}
