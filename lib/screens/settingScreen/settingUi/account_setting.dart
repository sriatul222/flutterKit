import 'package:club/extra/colors.dart';
import 'package:club/routes/routes_name.dart';
import 'package:club/widgets/popup_dialog.dart';
import 'package:club/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(
            color: MyColor.white,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: MyColor.white),
      child: Column(
        children: [
          const SizedBox(height: 12),
          AccountButton(
            icon: Icons.swap_horiz_outlined,
            title: 'Change Password',
            onTap: () {
              Navigator.pushNamed(context, RoutesName.changePasswordScreen);
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          AccountButton(
            icon: Icons.login,
            title: 'Sign Out',
            onTap: () {
              deleteAccountDialog(
                  context, "Are you sure you want to sign out?");
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          AccountButton(
            icon: Icons.logout,
            title: 'Delete Account',
            onTap: () {
              deleteAccountDialog(
                  context, "Are you sure you want to delete this account?");
            },
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class AccountButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const AccountButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColor.black,
                width: 2.0,
              ),
              color: MyColor.black,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Icon(icon, size: 25, color: MyColor.white),
          ),
          const SizedBox(width: 15),
          Expanded(
              child: GreyText(
            text: title,
            font: 'Sans',
            size: 14,
            weight: FontWeight.w500,
            color: MyColor.black,
          )),
          const Icon(Icons.arrow_forward_ios,
              size: 25, color: MyColor.hintColor)
        ],
      ),
    );
  }
}
