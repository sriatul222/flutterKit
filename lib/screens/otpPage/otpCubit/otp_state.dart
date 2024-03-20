import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class OtpState extends Equatable {
  const OtpState(
      {this.status = FormzStatus.pure,
      this.exceptionError,
      this.start = 30,
      this.timerEnded = false,
      this.otp,
      this.email});

  final FormzStatus status;
  final String? exceptionError;
  final String? otp;
  final String? email;
  final int start;
  final bool timerEnded;

  @override
  List<Object?> get props => [
        status,
        exceptionError.toString(),
        start,
        timerEnded,
        otp.toString(),
        email
      ];

  OtpState copyWith({
    FormzStatus? status,
    String? error,
    String? otp,
    String? email,
    int? start,
    bool? timerEnded,
  }) {
    return OtpState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      start: start ?? this.start,
      timerEnded: timerEnded ?? this.timerEnded,
      otp: otp ?? this.otp,
      email: email ?? this.email,
    );
  }
}
