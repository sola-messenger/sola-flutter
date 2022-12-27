// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/r.dart';

class InputBorderColumnField extends StatelessWidget {
  final String title;
  final String formKey;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? icon;

  const InputBorderColumnField({super.key,
    required this.title,
    required this.formKey,
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.icon});

  @override
  Widget build(BuildContext context) {
    Widget child = ReactiveTextField(
      keyboardType: keyboardType ?? TextInputType.text,
      formControlName: formKey,
      obscureText: obscureText,
      scrollPadding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: InputDecoration(
        hintText: hint.tr,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Color(0x35343466),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor,
              width: 1,
            )),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        constraints: const BoxConstraints(
          maxHeight: 30,
        ),
        prefixIcon: icon,
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 30,
          minWidth: 30,
          maxHeight: 18,
        ),
      ),
    );
    if (obscureText == true) {
      child = EyeState(
        builder: (state, isShow) {
          return ReactiveTextField(
            keyboardType: keyboardType ?? TextInputType.text,
            formControlName: formKey,
            obscureText: isShow,
            scrollPadding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: InputDecoration(
              hintText: hint.tr,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: Color(0x35343466),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.greyColor,
                    width: 1,
                  )),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              constraints: const BoxConstraints(
                maxHeight: 30,
              ),
              prefixIcon: icon,
              prefixIconConstraints: const BoxConstraints(
                maxWidth: 30,
                minWidth: 30,
                maxHeight: 18,
              ),
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 20,
                maxHeight: 10,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  state.call(!isShow);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                      !isShow ? R.assetsIconCloseEyeIcon: R.assetsIconEyeIcon ),
                ),
              ),
            ),
          );
        },
      );
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: AppTextStyles.black_bold_14,
        ),
        const SizedBox(
          height: 10,
        ),
        child,
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class EyeState extends StatefulWidget {
  final Widget Function(ValueChanged<bool> isState, bool isObscureText) builder;

  const EyeState({Key? key, required this.builder}) : super(key: key);

  @override
  State<EyeState> createState() => _EyeStateState();
}

class _EyeStateState extends State<EyeState> {
  late bool isShowObscureText;
  late ValueChanged<bool> isState;

  @override
  void initState() {
    super.initState();
    isShowObscureText = true;
    isState = (bool isSelect) {
      setState(() {
        isShowObscureText = isSelect;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(isState, isShowObscureText);
  }
}
