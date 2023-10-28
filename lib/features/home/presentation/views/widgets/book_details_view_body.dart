import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'book_details_section.dart';
import 'custom_book_details_appbar.dart';


class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book, });
  final BookModel book;
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        const CustomBookDetailsAppBar(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child:  Column(
                  children: [
                    BookDetailsSection(book: book),
                    const Expanded(
                        child: SizedBox(
                          height: 50,
                        )),
                    const SimilarBooksSection(),
                    const SizedBox(
                      height: 40,
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}








