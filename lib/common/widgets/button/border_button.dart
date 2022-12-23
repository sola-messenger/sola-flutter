// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/pressed_button.dart';
import 'button_size_enum.dart';

class BorderButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final ButtonSizeEnum buttonSizeEnum;
  final double textFontSize;
  final double height;
  final Color textColor;

  const BorderButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.buttonSizeEnum = ButtonSizeEnum.min,
    this.textFontSize = 14,
    this.height = 21 / 14,  this.textColor = AppColors.textBlackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressedButton(
      onPressed: onPressed,
      padding: _getPadding(),
      color: AppColors.lightBlueColor,
      pressedColor: AppColors.lightBlueColor.withOpacity(0.8),
      hoverColor: AppColors.lightBlueColor.withOpacity(0.8),
      borderRadius: BorderRadius.circular(5),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: textFontSize,
          height: height,
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
          vertical: 5,
        );
      case ButtonSizeEnum.normal:
        return const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        );
      case ButtonSizeEnum.large:
        return const EdgeInsets.symmetric(
          horizontal: 61,
          vertical: 10,
        );
    }
  }
}
