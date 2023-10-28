part of 'similar_books_cubit.dart';


abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class LoadingGetSimilarBooksData extends SimilarBooksInitial{}
class SuccessGetSimilarBooksData extends SimilarBooksInitial {
  final List<BookModel> books;
  SuccessGetSimilarBooksData(this.books);
}

class FailureGetSimilarBooksData extends SimilarBooksInitial {
  final String errorMessage;

  FailureGetSimilarBooksData(this.errorMessage);
}