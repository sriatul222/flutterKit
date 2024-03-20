import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.exceptionError,
    this.password,
    this.email,
  });

  final FormzStatus status;
  final String? exceptionError;
  final String? password;
  final String? email;

  @override
  List<Object?> get props => [
        status,
        email.toString(),
        exceptionError.toString(),
        password.toString(),
      ];

  LoginState copyWith({
    FormzStatus? status,
    String? error,
    String? password,
    String? email,
  }) {
    return LoginState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }
}
