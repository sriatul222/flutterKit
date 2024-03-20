import 'package:club/appTheme/theme_Cubit.dart';
import 'package:club/extra/app_variables.dart';
import 'package:club/extra/colors.dart';
import 'package:club/routes/routes_name.dart';
import 'package:club/screens/settingScreen/settingCubit/setting_cubit.dart';
import 'package:club/screens/settingScreen/settingCubit/setting_state.dart';
import 'package:club/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CmsAndTheme extends StatelessWidget {
  const CmsAndTheme({super.key});

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
          CMSButton(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            subTitle: 'Lock flutter kit to improve your privacy policy',
            onTap: () {
              Navigator.pushNamed(context, RoutesName.cmsScreen, arguments: {
                "screenName": 'Privacy Policy',
                "url": 'https://www.google.co.in/'
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          CMSButton(
            icon: Icons.privacy_tip_outlined,
            title: 'Terms-and-Conditions',
            subTitle: 'Lock flutter kit to improve your terms-and-conditions',
            onTap: () {
              Navigator.pushNamed(context, RoutesName.cmsScreen, arguments: {
                "screenName": 'Terms-and-Conditions',
                "url": 'https://www.google.co.in/'
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          CMSButton(
            icon: Icons.privacy_tip_outlined,
            title: 'FAQs',
            subTitle: 'Lock flutter kit to improve your FAQs',
            onTap: () {
              Navigator.pushNamed(context, RoutesName.cmsScreen, arguments: {
                "screenName": 'FAQs',
                "url": 'https://www.google.co.in/'
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        child: const Icon(Icons.nights_stay,
                            size: 25, color: MyColor.white),
                      ),
                      const SizedBox(width: 15),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GreyText(
                            text: 'Dark Mode',
                            font: 'Sans',
                            size: 14,
                            weight: FontWeight.w500,
                            color: MyColor.black,
                          ),
                          GreyText(
                            text: 'Automatic',
                            font: 'Sans',
                            size: 10,
                            weight: FontWeight.w400,
                            color: MyColor.hintColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Switch(
                      value: nightMode,
                      activeColor: MyColor.black,
                      inactiveTrackColor: MyColor.hintColor,
                      onChanged: (value) {
                        if (context.read<SettingCubit>().state.nightMode) {
                          context.read<SettingCubit>().nightMode(false);
                          context.read<ThemeCubit>().switchTheme();
                        } else {
                          context.read<SettingCubit>().nightMode(true);
                          context.read<ThemeCubit>().switchTheme();
                        }
                      }),
                ],
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class CMSButton extends StatelessWidget {
  final String title, subTitle;
  final IconData icon;
  final Function() onTap;

  const CMSButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.subTitle,
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
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreyText(
                text: title,
                font: 'Sans',
                size: 14,
                weight: FontWeight.w500,
                color: MyColor.black,
              ),
              GreyText(
                text: subTitle,
                font: 'Sans',
                size: 10,
                weight: FontWeight.w400,
                color: MyColor.hintColor,
              ),
            ],
          )),
          const Icon(Icons.arrow_forward_ios,
              size: 25, color: MyColor.hintColor)
        ],
      ),
    );
  }
}
