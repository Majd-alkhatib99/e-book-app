import 'package:book_app/core/util/color_data.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      color: ColorData.kPrimeColor,

    ));
  }
}
