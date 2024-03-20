import 'package:club/screens/loginScreen/loginCubit/login_cubit.dart';
import 'package:club/screens/loginScreen/loginUi/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) => LoginCubit(),
      child: LoginForm(),
    );
  }
}