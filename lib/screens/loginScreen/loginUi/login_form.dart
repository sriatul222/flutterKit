import 'dart:io';

import 'package:club/routes/routes_name.dart';
import 'package:club/widgets/button_widget.dart';
import 'package:club/extra/colors.dart';
import 'package:club/extra/my_utils.dart';
import 'package:club/screens/loginScreen/loginCubit/login_cubit.dart';
import 'package:club/widgets/rich_text.dart';
import 'package:club/widgets/text_input_field_password.dart';
import 'package:club/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extra/common_style.dart';
import '../../../widgets/hint_text.dart';
import '../../../widgets/text_input_field.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: MyColor.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: Text(
                  'Login Page',
                  style: textStyleBold.copyWith(fontSize: 20),
                )),
                const SizedBox(
                  height: 50,
                ),
                const HintText(
                  hint: 'Email*',
                ),
                const SizedBox(
                  height: 4,
                ),
                _SelfEmailInputField(),
                const SizedBox(
                  height: 15,
                ),
                const HintText(
                  hint: 'Password*',
                ),
                const SizedBox(
                  height: 4,
                ),
                _SelfPasswordInputField(),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.forgotPassword);
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: GreyText(
                      text: 'Forget Password?',
                      font: 'Sans',
                      size: 17,
                      weight: FontWeight.w500,
                      color: MyColor.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                  buttonName: 'Login',
                  onTap: () {
                    if (_formKey.currentState!.validate()  && MyUtils.checkClickNetwork(context)) {
                        context.read<LoginCubit>().loadData(context);
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: GreyText(
                    text: 'or continue with',
                    font: 'Sans',
                    size: 16,
                    weight: FontWeight.w400,
                    color: MyColor.black,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.read<LoginCubit>().googleLogin(context);
                        },
                        child: Image.asset(
                          "assets/images/google_icon.png",
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        )),
                    const SizedBox(width: 25),
                    Platform.isIOS
                        ?GestureDetector(
                        onTap: () {
                          context.read<LoginCubit>().appleLogin(context);
                        },
                        child: Image.asset(
                          "assets/images/apple_icon.png",
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        )):const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichTextWidget(
                    text1: "or continue with? ",
                    text2: "Sign up",
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.register),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelfEmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFields(
      textInputType: TextInputType.emailAddress,
      validator: (email) {
        return context.read<LoginCubit>().emailChanged(email);
      },
      onChanged: (email) {
        context.read<LoginCubit>().emailChanged(email);
      },
    );
  }
}

class _SelfPasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFieldPassword(
      textInputAction: TextInputAction.done,
      validator: (password) {
        return context.read<LoginCubit>().passwordChanged(password);
      },
      onChanged: (password) {
        context.read<LoginCubit>().passwordChanged(password);
      },
    );
  }
}
