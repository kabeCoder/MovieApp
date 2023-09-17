import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.buttonText,
    required this.buttonTextStyle,
    required this.onTap,
    this.buttonBackGroundColor,
    this.buttonRadius,
    this.width,
    this.leadingIcon,
    this.iconTextSpacing,
  });

  final String buttonText;
  final TextStyle buttonTextStyle;
  final Color? buttonBackGroundColor;
  final double? buttonRadius;
  final VoidCallback? onTap;
  final double? width;
  final Icon? leadingIcon;
  final double? iconTextSpacing;

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            buttonRadius!,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null) leadingIcon!,
          SizedBox(
            width: iconTextSpacing,
          ),
          Text(
            buttonText,
            style: buttonTextStyle,
          ),
        ],
      ),
    );

    if (width != null) {
      return SizedBox(
        width: width,
        child: button,
      );
    }

    return button;
  }
}
