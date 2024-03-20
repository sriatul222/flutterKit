import 'package:club/screens/forgetPasswordScreen/forgetPasswordCubit/forget_cubit.dart';
import 'package:club/screens/forgetPasswordScreen/forgetPasswordUi/forget_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetCubit>(
      create: (BuildContext context) => ForgetCubit(),
      child: ForgetForm(),
    );
  }
}