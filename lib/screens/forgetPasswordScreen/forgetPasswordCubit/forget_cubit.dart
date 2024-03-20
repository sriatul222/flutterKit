import 'package:club/Routes/routes_name.dart';
import 'package:club/extra/common_validator.dart';
import 'package:club/screens/forgetPasswordScreen/forgetPasswordCubit/forget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(const ForgetState());

  String? emailChanged(String? value) {
    final email =
        InputValidation.validateEmail(value ?? '', 'Please enter Valid E-mail');
    emit(state.copyWith(
      email: value,
    ));
    return email;
  }

  void loadData(context) {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    Future.delayed(const Duration(seconds: 2)).then((_) => {
          emit(state.copyWith(status: FormzStatus.submissionSuccess)),
          Navigator.pushNamed(context, RoutesName.newPassword),
        });
  }
}
