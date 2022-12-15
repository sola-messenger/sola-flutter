// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/pressed_button.dart';

class WhiteButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final ButtonSizeEnum buttonSizeEnum;
  final bool isImport;

  const WhiteButton(
      {Key? key,
      required this.title,
      this.onPressed,
      this.buttonSizeEnum = ButtonSizeEnum.min,
      this.isImport = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressedButton(
      onPressed: onPressed,
      padding: _getPadding(),
      color: AppColors.bgWhiteColor,
      pressedColor: AppColors.bgWhiteColor.withOpacity(0.8),
      hoverColor: AppColors.bgWhiteColor.withOpacity(0.8),
      borderRadius: BorderRadius.circular(5),
      child: Text(
        title,
        style: TextStyle(
          color: isImport ? AppColors.mainBlueColor : AppColors.greyColor,
          fontSize: 12,
          height: 14 / 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  EdgeInsets _getPadding() {
    switch (buttonSizeEnum) {
      case ButtonSizeEnum.min:
        return const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        );
      case ButtonSizeEnum.normal:
        return const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        );
      case ButtonSizeEnum.large:
        return const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 5,
        );
    }
  }
}
