import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.status = FormzStatus.pure,
    this.exceptionError,
    this.image,
    this.fileName,
    this.name,
    this.mobile,
    this.email,
    this.textControllerName,
    this.textControllerMobile,
    this.textControllerEmail,
  });

  final FormzStatus status;
  final String? exceptionError;
  final File? image;
  final File? fileName;
  final String? name;
  final String? mobile;
  final String? email;
  final TextEditingController? textControllerName;
  final TextEditingController? textControllerMobile;
  final TextEditingController? textControllerEmail;

  @override
  List<Object?> get props => [status, exceptionError,image, fileName,name,email,mobile,textControllerName,textControllerMobile,textControllerEmail];

  EditProfileState copyWith({
    FormzStatus? status,
    String? error,
    final File? image,
    final File? fileName,
    String? name,
    String? mobile,
    String? email,
    TextEditingController? textControllerName,
    TextEditingController? textControllerMobile,
    TextEditingController? textControllerEmail,
  })
  {
    return EditProfileState(
      status: status ?? this.status,
      exceptionError: error ?? exceptionError,
      image: image ?? this.image,
      fileName: fileName ?? this.fileName,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      textControllerName: textControllerName ?? this.textControllerName,
      textControllerMobile: textControllerMobile ?? this.textControllerMobile,
      textControllerEmail: textControllerEmail ?? this.textControllerEmail,
    );
  }
}