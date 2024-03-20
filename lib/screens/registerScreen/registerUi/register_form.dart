import 'package:club/extra/flutter_toast.dart';
import 'package:club/routes/routes_name.dart';
import 'package:club/widgets/button_widget.dart';
import 'package:club/extra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../extra/common_style.dart';
import '../../../extra/my_utils.dart';
import '../../../widgets/hint_text.dart';
import '../../../widgets/rich_text.dart';
import '../../../widgets/text_input_field.dart';
import '../../../widgets/text_input_field_password.dart';
import '../registerCubit/register_cubit.dart';
import '../registerCubit/register_state.dart';

class RegisterForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: MyColor.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                          child: Text(
                        'Sign up',
                        style: textStyleBold.copyWith(fontSize: 20),
                      )),
                      const SizedBox(
                        height: 50,
                      ),
                      const HintText(
                        hint: 'Name*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _SelfNameInputField(),
                      const SizedBox(
                        height: 15,
                      ),
                      const HintText(
                        hint: 'Mobile*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _SelfMobileInputField(),
                      const SizedBox(
                        height: 15,
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
                      _PasswordInputField(),
                      const SizedBox(
                        height: 15,
                      ),
                      const HintText(
                        hint: 'Confirm Password*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _ConfirmPasswordInputField(),
                      const SizedBox(
                        height: 30,
                      ),
                      const _CheckBoxAndTermConditions(),
                      const SizedBox(
                        height: 40,
                      ),
                      ButtonWidget(
                        buttonName: 'GET OTP',
                        onTap: () {
                          if (_formKey.currentState!.validate() && MyUtils.checkClickNetwork(context)) {
                            if (context.read<RegisterCubit>().state.checkBox == true) {
                              context.read<RegisterCubit>().loadData(context);
                            }else{
                              FlutterToast.showToast('Please Accept Terms & Conditions');
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: RichTextWidget(
                          text1: "Already have an account? ",
                          text2: "Login",
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                return state.status.isSubmissionInProgress
                    ? Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: MyColor.black,
                          size: 70,
                        ),
                      )
                    : Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckBoxAndTermConditions extends StatelessWidget {
  const _CheckBoxAndTermConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<RegisterCubit>().checkBox(!state.checkBox);
              },
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: state.checkBox
                    ? const Icon(Icons.check, size: 16, color: MyColor.black)
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            RichTextWidget(
              text1: "I agree to ",
              text2: "Terms of Service",
              onTap: () {
                Navigator.pushNamed(context, RoutesName.cmsScreen,
                    arguments: {"screenName": 'Terms of Service',"url":'https://www.google.co.in/'});
              },
            ),
            RichTextWidget(
              text1: " and ",
              text2: "Privacy",
              onTap: () {
                Navigator.pushNamed(context, RoutesName.cmsScreen,
                    arguments: {"screenName": 'Privacy',"url":'https://www.google.co.in/'});
              },
            ),
          ],
        );
      },
    );
  }
}

class _SelfNameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFields(
      validator: (name) {
        return context.read<RegisterCubit>().nameChanged(name);
      },
      onChanged: (name) {
        context.read<RegisterCubit>().nameChanged(name);
      },
    );
  }
}

class _SelfMobileInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFields(
      textInputType: TextInputType.number,
      maxLength: 10,
      validator: (mobile) {
        return context.read<RegisterCubit>().mobileChanged(mobile);
      },
      onChanged: (mobile) {
        context.read<RegisterCubit>().mobileChanged(mobile);
      },
    );
  }
}

class _SelfEmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFields(
      validator: (email) {
        return context.read<RegisterCubit>().emailChanged(email);
      },
      onChanged: (email) {
        context.read<RegisterCubit>().emailChanged(email);
      },
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFieldPassword(
      textInputAction: TextInputAction.next,
      validator: (password) {
        return context.read<RegisterCubit>().passwordChanged(password);
      },
      onChanged: (password) {
        context.read<RegisterCubit>().passwordChanged(password);
      },
    );
  }
}

class _ConfirmPasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFieldPassword(
      textInputAction: TextInputAction.done,
      validator: (password) {
        return context.read<RegisterCubit>().confirmPasswordChanged(password);
      },
      onChanged: (password) {
        context.read<RegisterCubit>().confirmPasswordChanged(password);
      },
    );
  }
}
