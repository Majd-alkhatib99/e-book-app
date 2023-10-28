part of 'newest_books_cubit.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}
class LoadingGetNewestBooksData extends NewestBooksState {}

class SuccessGetNewestBooksData extends NewestBooksState {
  final List<BookModel> books;
  SuccessGetNewestBooksData(this.books);
}

class FailureGetNewestBooksData extends NewestBooksState {
  final String errorMessage;

  FailureGetNewestBooksData(this.errorMessage);
}