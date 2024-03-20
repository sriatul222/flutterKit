import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class SettingState extends Equatable {
  const SettingState({
    this.status = FormzStatus.pure,
    this.exceptionError,
    this.nightMode = false,
  });

  final FormzStatus status;
  final String? exceptionError;
  final bool nightMode;

  @override
  List<Object?> get props => [status, exceptionError,nightMode];

  SettingState copyWith({
    FormzStatus? status,
    String? error,
    bool? nightMode,
  })
  {
    return SettingState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      nightMode: nightMode ?? this.nightMode,
    );
  }
}