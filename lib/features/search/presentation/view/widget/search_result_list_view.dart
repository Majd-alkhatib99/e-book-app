import 'package:book_app/core/util/app_route.dart';
import 'package:book_app/core/util/style.dart';
import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return SearchResultListViewItem(book: books[index]);
      },
    );
  }
}


class SearchResultListViewItem extends StatelessWidget {
  const SearchResultListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRoutes.detailsView, extra: book),
      child: Padding(
        padding:
        const EdgeInsets.only(right: 51, left: 30, top: 10, bottom: 10),
        child: SizedBox(
          height: 120.0,
          child: Row(
            children: [
              CustomBookImage(
                  imageURL: book.volumeInfo.imageLinks == null
                      ? book.volumeInfo.imageLinks!.thumbnail.toString()
                      : 'https://images.twinkl.co.uk/tw1n/image/private/t_630/u/ux/pc_ver_1.png'),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        book.volumeInfo.title?? 'null',
                        style: Style.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      book.volumeInfo.authors!=null?  book.volumeInfo.authors!.first:'null',
                      style: Style.textStyle14.copyWith(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Style.textStyle16
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        const Spacer(),
                        BookRating(
                          countRating: book.volumeInfo.ratingsCount ?? 0,
                          rating: book.volumeInfo.averageRating !=null
                              ? book.volumeInfo.averageRating!.round()
                              : 0,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
