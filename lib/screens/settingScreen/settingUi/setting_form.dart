import 'package:club/screens/settingScreen/settingUi/account_setting.dart';
import 'package:club/screens/settingScreen/settingUi/cms_and_theme.dart';
import 'package:club/screens/settingScreen/settingUi/setting_view_profile.dart';
import 'package:club/widgets/common_appbar_widget.dart';
import 'package:flutter/material.dart';

class SettingForm extends StatelessWidget {
  const SettingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Setting Page', appBar: AppBar(),iconButton: false),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingViewProfile(),
                  SizedBox(height: 10),
                  CmsAndTheme(),
                  Padding(
                    padding: EdgeInsets.only(left:12.0, top: 6),
                    child: Text(
                      'Account',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                  ),
                  AccountSetting(),
                ],
              ),
            ),
          ),
        ));
  }
}




