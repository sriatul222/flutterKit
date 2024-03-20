import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCropperWidget {
  static selectImages(ImageSource source, BuildContext context, bool cropStatus,
      File? imageName) async {
    if (source == ImageSource.gallery) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: source);
      var imageFile = image != null ? File(image.path) : null;
      if (image != null) {
        imageName = File(image.name);
      }

      if (imageFile != null) {
        if (cropStatus == true) {
          CroppedFile cropResult = await crop(imageFile);
          return cropResult;
        } else {
          return imageFile;
        }
      } else {
        return null;
      }
    } else {
      XFile? image = await ImagePicker().pickImage(source: source);
      var imageFile = image != null ? File(image.path) : null;

      imageName = (image != null ? File(image.name) : null)!;
      if (imageFile != null) {
        if (cropStatus == true) {
          CroppedFile cropResult = await crop(imageFile);
          return cropResult;
        } else {
          return imageFile;
        }
      } else {
        return null;
      }
    }
  }

  static crop(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              hideBottomControls: true,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
            rotateButtonsHidden: true,
            resetButtonHidden: true,
            aspectRatioPickerButtonHidden: true,
          )
        ]);
    print("crop data is $croppedFile");
    if (croppedFile != null) {
      return croppedFile;
    } else {
      return null;
    }
  }
}

class FlutterAbsolutePath {
  static const MethodChannel _channel = MethodChannel('flutter_absolute_path');

  /// Gets absolute path of the file from android URI or iOS PHAsset identifier
  /// The return of this method can be used directly with flutter [File] class
  static Future<String> getAbsolutePath(String uri) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'uri': uri,
    };
    final String path = await _channel.invokeMethod('getAbsolutePath', params);
    return path;
  }
}
