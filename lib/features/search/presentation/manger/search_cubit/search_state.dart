part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingGetSearchResult extends SearchState {}
class SuccessGetSearchResult extends SearchState {
  final List<BookModel> booksModel;

  SuccessGetSearchResult(this.booksModel);
}
class FailureGetSearchResult extends SearchState {
  final String errorMessage;

  FailureGetSearchResult(this.errorMessage);
}

