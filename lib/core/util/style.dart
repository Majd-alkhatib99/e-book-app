import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Style {
  static const TextStyle textStyle14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal);

  static const TextStyle textStyle16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  static const TextStyle textStyle18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

  static TextStyle textStyle20 = GoogleFonts.playfair(
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal));

  static TextStyle textStyle20Copy =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.normal);

  static TextStyle textStyle30 = GoogleFonts.playfair(
      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.normal));
}
