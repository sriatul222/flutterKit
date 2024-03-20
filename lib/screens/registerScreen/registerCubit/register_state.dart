import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.exceptionError,
    this.name,
    this.mobile,
    this.email,
    this.password,
    this.confirmPassword,
    this.checkBox = false,
  });

  final FormzStatus status;
  final String? exceptionError;
  final bool checkBox;
  final String? password;
  final String? name;
  final String? mobile;
  final String? email;
  final String? confirmPassword;

  @override
  List<Object?> get props => [
        status,
        exceptionError.toString(),
        password.toString(),
        name.toString(),
        mobile.toString(),
        confirmPassword.toString(),
        checkBox,
        email.toString()
      ];

  RegisterState copyWith({
    FormzStatus? status,
    String? error,
    String? password,
    String? name,
    String? mobile,
    String? email,
    String? confirmPassword,
    bool? checkBox,
  }) {
    return RegisterState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      password: password ?? this.password,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      checkBox: checkBox ?? this.checkBox,
    );
  }
}
