import 'package:club/extra/colors.dart';
import 'package:club/extra/my_utils.dart';
import 'package:club/screens/changePasswordScreen/changePasswordCubit/change_password_cubit.dart';
import 'package:club/screens/changePasswordScreen/changePasswordCubit/change_password_state.dart';
import 'package:club/widgets/button_widget.dart';
import 'package:club/widgets/common_appbar_widget.dart';
import 'package:club/widgets/hint_text.dart';
import 'package:club/widgets/text_input_field_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChangePasswordForm extends StatelessWidget {
  ChangePasswordForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: CommonAppBar(title: 'Change Password Screen', appBar: AppBar(),iconButton: true),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const HintText(
                        hint: 'Password*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _PasswordInputField(),
                      const SizedBox(height: 30),
                      const HintText(
                        hint: 'New Password*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _NewPasswordInputField(),
                      const SizedBox(height: 30),
                      const HintText(
                        hint: 'Confirm Password*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _ConfirmPasswordInputField(),
                      const SizedBox(
                        height: 80,
                      ),
                      ButtonWidget(
                        buttonName: 'Change Password',
                        onTap: () {
                          if (_formKey.currentState!.validate() && MyUtils.checkClickNetwork(context)) {
                            context.read<ChangePasswordCubit>().loadData(context);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                      builder: (context, state) {
                        return state.status.isSubmissionInProgress
                            ? Container(
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          child: LoadingAnimationWidget.fourRotatingDots(
                            color: MyColor.black,
                            size: 70,
                          ),
                        )
                            : Container();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFieldPassword(
      textInputAction: TextInputAction.next,
      validator: (password) {
        return context.read<ChangePasswordCubit>().passwordChanged(password);
      },
      onChanged: (password) {
        context.read<ChangePasswordCubit>().passwordChanged(password);
      },
    );
  }
}

class _NewPasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFieldPassword(
      textInputAction: TextInputAction.next,
      validator: (password) {
        return context.read<ChangePasswordCubit>().newPasswordChanged(password);
      },
      onChanged: (password) {
        context.read<ChangePasswordCubit>().newPasswordChanged(password);
      },
    );
  }
}

class _ConfirmPasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFieldPassword(
      validator: (password) {
        return context
            .read<ChangePasswordCubit>()
            .confirmPasswordChanged(password);
      },
      onChanged: (password) {
        context.read<ChangePasswordCubit>().confirmPasswordChanged(password);
      },
    );
  }
}