import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    this.status = FormzStatus.pure,
    this.exceptionError,
  });

  final FormzStatus status;
  final String? exceptionError;

  @override
  List<Object?> get props => [status, exceptionError];

  FavoriteState copyWith({
    FormzStatus? status,
    String? error,
  })
  {
    return FavoriteState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
    );
  }
}