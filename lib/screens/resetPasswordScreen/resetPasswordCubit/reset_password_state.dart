import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class NewPasswordState extends Equatable {
  const NewPasswordState({
    this.status = FormzStatus.pure,
    this.exceptionError,
    this.password,
    this.confirmPassword,
  });

  final FormzStatus status;
  final String? exceptionError;
  final String? password;
  final String? confirmPassword;

  @override
  List<Object?> get props => [
        status,
        exceptionError.toString(),
        password.toString(),
        confirmPassword.toString(),
      ];

  NewPasswordState copyWith({
    FormzStatus? status,
    String? error,
    String? password,
    String? confirmPassword,
  }) {
    return NewPasswordState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
