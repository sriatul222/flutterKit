import 'package:club/screens/settingScreen/settingCubit/setting_cubit.dart';
import 'package:club/screens/settingScreen/settingUi/setting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<SettingCubit>(
      create: (BuildContext context) => SettingCubit(),
      child: const SettingForm(),
    );
  }
}