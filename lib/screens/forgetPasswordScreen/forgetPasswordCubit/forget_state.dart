import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class ForgetState extends Equatable {
  const ForgetState({
    this.status = FormzStatus.pure,
    this.exceptionError,
    this.email,
  });

  final FormzStatus status;
  final String? exceptionError;
  final  String? email;

  @override
  List<Object?> get props => [status, exceptionError.toString(), email.toString()];

  ForgetState copyWith({
    FormzStatus? status,
    String? error,
    TextEditingController? textControllerEmail,
    String? email,
  })
  {
    return ForgetState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      email: email ?? this.email,
    );
  }
}
