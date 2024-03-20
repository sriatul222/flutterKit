import 'package:club/extra/common_validator.dart';
import 'package:club/routes/routes_name.dart';
import 'package:club/screens/registerScreen/registerCubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void checkBox(value) {
    emit(state.copyWith(
      checkBox: value,
    ));
  }

  String? emailChanged(String? value) {
    final email =
        InputValidation.validateEmail(value ?? '', 'Please enter your E-mail');
    emit(state.copyWith(
      email: value,
    ));
    return email;
  }

  String? nameChanged(String? value) {
    final name =
    InputValidation.validateEmptyString(value ?? '', 'Please enter your name');
    emit(state.copyWith(
      name: value,
    ));
    return name;
  }

  String? mobileChanged(String? value) {
    final mobile =
    InputValidation.validatePhoneNumber(value ?? '', 'Please enter your mobile');
    emit(state.copyWith(
      mobile: value,
    ));
    return mobile;
  }

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
          Navigator.pushNamed(context, RoutesName.otp,
              arguments: {"email": state.email}),
        });
  }
}
