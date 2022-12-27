// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_text_styles.dart';

class MoreInputColumnField extends StatelessWidget {
  final String title;
  final String formKey;
  final String hint;
  final bool obscureText;

  const MoreInputColumnField(
      {super.key,
      required this.title,
      required this.formKey,
      required this.hint,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: AppTextStyles.black_bold_14,
        ),
        const SizedBox(
          height: 13,
        ),
        ReactiveFormConsumer(
          builder: (BuildContext context, FormGroup formGroup, Widget? child) {
            final ctl = formGroup.control(formKey);
            return Stack(
              children: [
                child!,
                Positioned(
                  bottom: 2,
                  right: 3,
                  child: Text(
                    '${ctl.value == null ? '0' : '${ctl.value.toString().length}'}/300',
                    style: const TextStyle(
                      color: Color(0xFFC2C2C2),
                      fontSize: 8,
                      height: 14 / 8,
                    ),
                  ),
                ),
              ],
            );
          },
          child: ReactiveTextField(
            formControlName: formKey,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint.tr,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              hintStyle: const TextStyle(
                fontSize: 8,
                height: 14 / 8,
                color: Color(0xFFC2C2C2),
              ),
              constraints: const BoxConstraints(
                minHeight: 73,
                maxHeight: 73,
              ),
              border: const OutlineInputBorder(),
            ),
            maxLines: 99,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
