import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/util/style.dart';
import 'action_button.dart';
import 'book_rating.dart';

import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book,});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.30),
          child:  CustomBookImage(
              imageURL: book.volumeInfo.imageLinks != null
                  ? book.volumeInfo.imageLinks!.thumbnail.toString()
                  : 'https://images.twinkl.co.uk/tw1n/image/private/t_630/u/ux/pc_ver_1.png'
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Text(
          book.volumeInfo.title!,
          style: Style.textStyle30,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 5.0,
        ),
         Opacity(
          opacity: 0.7,
          child: SizedBox(
            width: MediaQuery.of(context).size.width *.7,
            child: Text(
              book.volumeInfo.authors![0],
              style: Style.textStyle18,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          countRating: book.volumeInfo.ratingsCount??0,
          rating: book.volumeInfo.averageRating !=null
              ? book.volumeInfo.averageRating!.round()
              : 0,
        ),
        const SizedBox(
          height: 37,
        ),
        BookActionButtons(book: book),
      ],
    );
  }
}
