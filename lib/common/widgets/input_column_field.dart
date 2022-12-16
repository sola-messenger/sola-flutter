// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputColumnField extends StatelessWidget {
  final String title;
  final String formKey;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;

  const InputColumnField(
      {super.key,
      required this.title,
      required this.formKey,
      required this.hint,
      this.obscureText = false,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 14,
            height: 21 / 14,
          ),
        ),
        ReactiveTextField(
            keyboardType: keyboardType ?? TextInputType.text,
            formControlName: formKey,
            obscureText: obscureText,
            decoration: InputDecoration(
                hintText: hint.tr,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0x35343466),
                ))),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
