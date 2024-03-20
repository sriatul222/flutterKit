import 'package:club/extra/my_utils.dart';
import 'package:club/widgets/button_widget.dart';
import 'package:club/extra/colors.dart';
import 'package:club/widgets/common_appbar_widget.dart';
import 'package:club/widgets/no_network_widget.dart';
import 'package:club/screens/resetPasswordScreen/resetPasswordCubit/reset_password_cubit.dart';
import 'package:club/screens/resetPasswordScreen/resetPasswordCubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../extra/common_style.dart';
import '../../../widgets/hint_text.dart';
import '../../../widgets/text_input_field_password.dart';

class NewPasswordForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  NewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: MyColor.white,
        appBar: CommonAppBar(title:'Reset Password', appBar: AppBar(),iconButton: true),
        body: SafeArea(
          child: NoNetworkWidget(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Center(
                            child: Text(
                          'Please choose your Password',
                              style: textStyleBold.copyWith(fontSize: 20),
                        )),
                        const SizedBox(height: 80),
                        const HintText(
                          hint: 'Password*',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        _PasswordInputField(),
                        const SizedBox(height: 30),
                        const HintText(
                          hint: 'Confirm Password*',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        _ConfirmPasswordInputField(),
                        const SizedBox(height: 80),
                        ButtonWidget(
                          buttonName: 'Update',
                          onTap: () {
                            if (_formKey.currentState!.validate() && MyUtils.checkClickNetwork(context)) {
                              context
                                  .read<NewPasswordCubit>()
                                  .loadData(context);
                            }
                          },
                        )
                      ],
                    ),
                  )),
                  BlocBuilder<NewPasswordCubit, NewPasswordState>(
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
        return context.read<NewPasswordCubit>().passwordChanged(password);
      },
      onChanged: (password) {
        context.read<NewPasswordCubit>().passwordChanged(password);
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
            .read<NewPasswordCubit>()
            .confirmPasswordChanged(password);
      },
      onChanged: (password) {
        context.read<NewPasswordCubit>().confirmPasswordChanged(password);
      },
    );
  }
}
