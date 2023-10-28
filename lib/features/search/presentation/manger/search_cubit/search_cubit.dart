import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:book_app/features/search/data/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());

  final SearchRepo _searchRepo;
  Future<void> fetchSearchResult({required String search}) async {
    emit(LoadingGetSearchResult());
    var response = await _searchRepo.fetchSearchResult(search: search);
    print(response.length());
    response.fold((failure) {
      emit(FailureGetSearchResult(failure.errorMessage));
    }, (books) {
      emit(SuccessGetSearchResult(books));
    });
  }
}
