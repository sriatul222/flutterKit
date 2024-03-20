import 'package:club/extra/colors.dart';
import 'package:club/routes/routes_name.dart';
import 'package:club/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SettingViewProfile extends StatelessWidget {
  const SettingViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       Navigator.pushNamed(context, RoutesName.editProfileScreen);
     },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            border: Border.all(
              color: MyColor.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColor.hintColor,
                    width: 20.0,
                  ),
                  shape: BoxShape.circle,
                  color: MyColor.black),
              child: Image.asset('assets/images/user_icon.png', fit: BoxFit.fill),
            ),
            const SizedBox(
              width: 25,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreyText(
                  text: 'William',
                  font: 'Sans',
                  size: 18,
                  weight: FontWeight.w600,
                  color: MyColor.white,
                ),
                GreyText(
                  text: 'Gonzalez',
                  font: 'Sans',
                  size: 18,
                  weight: FontWeight.w600,
                  color: MyColor.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}