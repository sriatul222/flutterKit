import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.status = FormzStatus.pure,
    this.exceptionError,
    this.password,
    this.newPassword,
    this.confirmPassword,
  });

  final FormzStatus status;
  final String? exceptionError;
  final String? password;
  final String? newPassword;
  final String? confirmPassword;

  @override
  List<Object?> get props => [status, exceptionError,password,newPassword,confirmPassword];

  ChangePasswordState copyWith({
    FormzStatus? status,
    String? error,
    String? password,
    String? newPassword,
    String? confirmPassword,
  })
  {
    return ChangePasswordState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}