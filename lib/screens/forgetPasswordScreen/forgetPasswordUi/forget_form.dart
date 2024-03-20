import 'package:club/widgets/button_widget.dart';
import 'package:club/extra/colors.dart';
import 'package:club/widgets/common_appbar_widget.dart';
import 'package:club/screens/forgetPasswordScreen/forgetPasswordCubit/forget_cubit.dart';
import 'package:club/screens/forgetPasswordScreen/forgetPasswordCubit/forget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../extra/my_utils.dart';
import '../../../widgets/hint_text.dart';
import '../../../widgets/text_input_field.dart';

class ForgetForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ForgetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: MyColor.white,
          appBar: CommonAppBar(title:'Forgot Password', appBar: AppBar(),iconButton: true),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100),
                          const HintText(
                            hint: 'Email*',
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          _SelfEmailInputField(),
                          const SizedBox(height: 80),
                          ButtonWidget(
                            buttonName: 'Next',
                            onTap: () {
                              if (_formKey.currentState!.validate() && MyUtils.checkClickNetwork(context)) {
                                  context.read<ForgetCubit>().loadData(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<ForgetCubit, ForgetState>(
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
        ));
  }
}

class _SelfEmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextInputFields(
      validator: (email) {
        return context.read<ForgetCubit>().emailChanged(email);
      },
      onChanged: (email) {
        context.read<ForgetCubit>().emailChanged(email);
      },
    );
  }
}
