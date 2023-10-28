import 'package:flutter/material.dart';

import '../util/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
        required this.text,
        required this.backgroundColor,
        required this.borderRadius,
        required this.textColor,
        required this.fontWeight, this.onPressed});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final FontWeight fontWeight;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              textStyle: Style.textStyle16),
          child: Text(
            text,
            style: TextStyle(fontWeight: fontWeight, color: textColor),
          ),
        ),
      ),
    );
  }
}