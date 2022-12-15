// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputColumnBorderField extends StatelessWidget {
  final String title;
  final String formKey;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;

  const InputColumnBorderField(
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
        Text(title.tr),
        ReactiveTextField(
          keyboardType: keyboardType ?? TextInputType.text,
          formControlName: formKey,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint.tr,
            border: const OutlineInputBorder(
              gapPadding: 0,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 2,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
