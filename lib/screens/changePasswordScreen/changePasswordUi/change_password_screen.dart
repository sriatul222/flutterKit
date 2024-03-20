import 'package:club/screens/changePasswordScreen/changePasswordCubit/change_password_cubit.dart';
import 'package:club/screens/changePasswordScreen/changePasswordUi/change_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<ChangePasswordCubit>(
      create: (BuildContext context) => ChangePasswordCubit(),
      child: ChangePasswordForm(),
    );
  }
}