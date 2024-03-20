import 'package:club/extra/colors.dart';
import 'package:club/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final bool iconButton;

  const CommonAppBar({super.key, required this.title, required this.appBar, required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      centerTitle: true,
      leading: iconButton?IconButton(
          icon: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.arrow_back_ios,
              color: MyColor.white,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.pop(context)):null,
      title: GreyText(
        text: title,
        font: 'Sans',
        size: 17,
        weight: FontWeight.w500,
        color: MyColor.white,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
