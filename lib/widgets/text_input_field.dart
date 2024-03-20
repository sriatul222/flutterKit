import 'package:club/extra/common_style.dart';
import 'package:flutter/material.dart';

class TextInputFields extends StatelessWidget {
  final Function(String value) onChanged;
  final String? Function(String? value) validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  final int maxLength;

  const TextInputFields(
      {super.key,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.emailAddress,
      this.textEditingController ,
      required this.validator,
      required this.onChanged,
      this.maxLength = 50});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      style: textStyleNormal,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      maxLength: maxLength,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        counterText: "",
        fillColor: Colors.white,
        alignLabelWithHint: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: outlineInputBorderRed,
        focusedErrorBorder: outlineInputBorderRed,
      ),
    );
  }
}
