import 'package:book_app/core/util/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.countRating});

  final int rating;
  final int countRating;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
        const FaIcon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rating.toString(),
          style: Style.textStyle16,
        ),
        const SizedBox(
          width: 9,
        ),
        Opacity(
          opacity: .5,
          child: Text('($countRating)', style: Style.textStyle14),
        ),
      ],
    );
  }
}
