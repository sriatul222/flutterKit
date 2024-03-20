import 'package:club/screens/resetPasswordScreen/resetPasswordCubit/reset_password_cubit.dart';
import 'package:club/screens/resetPasswordScreen/resetPasswordUi/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewPasswordCubit>(
      create: (BuildContext context) => NewPasswordCubit(),
      child: NewPasswordForm(),
    );
  }
}