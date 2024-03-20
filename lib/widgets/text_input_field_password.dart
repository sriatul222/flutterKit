import 'package:club/extra/common_style.dart';
import 'package:flutter/material.dart';

class TextInputFieldPassword extends StatelessWidget {
  final Function(String value) onChanged;
  final String? Function(String? value) validator;
  final TextInputAction textInputAction;
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);

  TextInputFieldPassword(
      {super.key,
      this.textInputAction = TextInputAction.done,
      required this.validator,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isPasswordVisible,
        builder: (BuildContext context, bool counterValue, Widget? child) {
          return TextFormField(
            obscureText: isPasswordVisible.value,
            autovalidateMode: AutovalidateMode.disabled,
            style: textStyleNormal,
            keyboardType: TextInputType.emailAddress,
            textInputAction: textInputAction,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              alignLabelWithHint: true,
              suffixIcon: GestureDetector(
                child: Icon(
                  counterValue
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
                onTap: () => isPasswordVisible.value = !isPasswordVisible.value,
              ),
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              errorBorder: outlineInputBorderRed,
              focusedErrorBorder: outlineInputBorderRed,
            ),
          );
        });
  }
}
