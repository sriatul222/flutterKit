import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CmsState extends Equatable {
  const CmsState({
    this.status = FormzStatus.pure,
    this.exceptionError,
    this.indexStack = 0,
    required this.webController,
  });

  final FormzStatus status;
  final String? exceptionError;
  final int indexStack;
  final Completer<WebViewController> webController;

  @override
  List<Object?> get props => [status, exceptionError,indexStack,webController];

  CmsState copyWith({
    FormzStatus? status,
    String? error,
    int? indexStack,
    Completer<WebViewController>? webController,
  })
  {
    return CmsState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      indexStack: indexStack ?? this.indexStack,
      webController: webController ?? this.webController,
    );
  }
}