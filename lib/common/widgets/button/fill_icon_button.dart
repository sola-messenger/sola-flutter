// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/pressed_button.dart';

class FillIconButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final ButtonSizeEnum buttonSizeEnum;
  final double textFontSize;
  final double height;
  final String image;

  const FillIconButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.buttonSizeEnum = ButtonSizeEnum.min,
    this.textFontSize = 14,
    this.height = 21 / 14,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressedButton(
      onPressed: onPressed,
      padding: _getPadding(),
      color: AppColors.mainBlueColor,
      pressedColor: AppColors.mainBlueColor.withOpacity(0.8),
      hoverColor: AppColors.mainBlueColor.withOpacity(0.8),
      borderRadius: BorderRadius.circular(5),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 14,
            height: 14,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: textFontSize,
              height: height,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _getPadding() {
    switch (buttonSizeEnum) {
      case ButtonSizeEnum.min:
        return const EdgeInsets.symmetric(
          horizontal: 8,
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
