


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MoreInputColumnField extends StatelessWidget {
  final String title;
  final String formKey;
  final String hint;
  final bool obscureText;

  const MoreInputColumnField({super.key, required this.title, required this.formKey, required this.hint,  this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.tr),
        ReactiveTextField(
            formControlName: formKey,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint.tr,
              border: const OutlineInputBorder(),
            ),maxLines: 3,),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}