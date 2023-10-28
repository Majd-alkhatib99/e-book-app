import 'package:book_app/core/util/color_data.dart';
import 'package:book_app/core/util/style.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorText,
      style: Style.textStyle20.copyWith(color: ColorData.kPrimeColor),
    );
  }
}
