import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = FormzStatus.pure,
    this.exceptionError,
  });

  final FormzStatus status;
  final String? exceptionError;

  @override
  List<Object?> get props => [status, exceptionError];

  HomeState copyWith({
    FormzStatus? status,
    String? error,
  })
  {
    return HomeState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
    );
  }
}