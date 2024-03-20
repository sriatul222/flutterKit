import 'package:club/extra/common_validator.dart';
import 'package:club/screens/changePasswordScreen/changePasswordCubit/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState());


  String? passwordChanged(String? value) {
    final password = InputValidation.validatePassword(
        value ?? '', 'Please enter Valid Password');
    emit(state.copyWith(
      password: value,
    ));
    return password;
  }

  String? newPasswordChanged(String? value) {
    final newPassword = InputValidation.validatePassword(
        value ?? '', 'Please enter Valid New Password');
    emit(state.copyWith(
      newPassword: value,
    ));
    return newPassword;
  }

  String? confirmPasswordChanged(String? value) {
    emit(state.copyWith(
      confirmPassword: value,
    ));
    String?  confirmPassword = state.newPassword == value
        ? null
        : "New Password and Confirm Password does not match";
    return confirmPassword;
  }

  void loadData(context) {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    Future.delayed(const Duration(seconds: 2)).then((_) => {
      emit(state.copyWith(status: FormzStatus.submissionSuccess)),
      Navigator.pop(context),
    });
  }

}