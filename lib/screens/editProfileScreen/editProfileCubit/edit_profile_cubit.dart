import 'dart:io';

import 'package:club/extra/common_validator.dart';
import 'package:club/screens/editProfileScreen/editProfileCubit/edit_profile_state.dart';
import 'package:club/widgets/image_cropper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState());

  Future getImageFromGallery(context) async {
    var galleryImage = await ImageCropperWidget.selectImages(
        ImageSource.gallery, context, true, state.fileName);
    if (galleryImage != null) {
      emit(state.copyWith(
        image: File(galleryImage.path),
        fileName: state.fileName,
      ));
    }
  }

  Future getImageFromCamera(context) async {
    var cameraImage = await ImageCropperWidget.selectImages(
        ImageSource.camera, context, true, state.fileName);

    if (cameraImage != null) {
      emit(state.copyWith(
          image: File(cameraImage.path), fileName: state.fileName));
    }
  }

  String? emailChanged(String? value) {
    final email =
    InputValidation.validateEmail(value ?? '', 'Please enter your E-mail');
    emit(state.copyWith(
      email: value,
    ));
    return email;
  }

  String? nameChanged(String? value) {
    final name =
    InputValidation.validateEmptyString(value ?? '', 'Please enter your name');
    emit(state.copyWith(
      name: value,
    ));
    return name;
  }

  String? mobileChanged(String? value) {
    final mobile =
    InputValidation.validatePhoneNumber(value ?? '', 'Please enter your mobile');
    emit(state.copyWith(
      mobile: value,
    ));
    return mobile;
  }

  void loadData(context) {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    Future.delayed(const Duration(seconds: 2)).then((_) => {
      emit(state.copyWith(status: FormzStatus.submissionSuccess)),
      Navigator.pop(context),
    });
  }

}