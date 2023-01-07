// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';

class InputColumnField extends StatelessWidget {
  final String title;
  final String formKey;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Color? textColor;

  const InputColumnField(
      {super.key,
      required this.title,
      required this.formKey,
      required this.hint,
      this.obscureText = false,
      this.keyboardType,
      this.icon,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: TextStyle(
            color: textColor ?? AppColors.textBlackColor,
            fontSize: 14,
            height: 21 / 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        ReactiveTextField(
          keyboardType: keyboardType ?? TextInputType.text,
          formControlName: formKey,
          obscureText: obscureText,
          scrollPadding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          enableSuggestions: true,
          decoration: InputDecoration(
            hintText: hint.tr,
            constraints: const BoxConstraints(
              maxHeight: 40,
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Color(0x35343466),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            errorStyle: const TextStyle(
              fontSize: 0,
            ),
            prefixIcon: icon,
            prefixIconConstraints: icon == null
                ? null
                : const BoxConstraints(
                    maxWidth: 30,
                    minWidth: 30,
                    maxHeight: 18,
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
