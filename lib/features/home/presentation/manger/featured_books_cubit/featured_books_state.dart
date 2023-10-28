part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class LoadingGetFeaturedBooksData extends FeaturedBooksState {}

class SuccessGetFeaturedBooksData extends FeaturedBooksState {
  final List<BookModel> books;
  SuccessGetFeaturedBooksData(this.books);
}

class FailureGetFeaturedBooksData extends FeaturedBooksState {
  final String errorMessage;

  FailureGetFeaturedBooksData(this.errorMessage);
}


