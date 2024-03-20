import 'package:club/Routes/routes_name.dart';
import 'package:club/extra/common_validator.dart';
import 'package:club/screens/resetPasswordScreen/resetPasswordCubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(const NewPasswordState());

  String? passwordChanged(String? value) {
    final password = InputValidation.validatePassword(
        value ?? '', 'Please enter Valid Password');
    emit(state.copyWith(
      password: value,
    ));
    return password;
  }

  String? confirmPasswordChanged(String? value) {
    emit(state.copyWith(
      confirmPassword: value,
    ));
    String?  confirmPassword = state.password == value
          ? null
          : "Password and Confirm Password does not match";
    return confirmPassword;
  }

  void loadData(context) {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    Future.delayed(const Duration(seconds: 2)).then((_) => {
          emit(state.copyWith(status: FormzStatus.submissionSuccess)),
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.login, (Route<dynamic> route) => false),
        });
  }
}
