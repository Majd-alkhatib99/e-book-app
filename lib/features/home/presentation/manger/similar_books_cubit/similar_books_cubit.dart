import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/models/books_model/book_model.dart';
import '../../../data/repo/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._homeRepo) : super(SimilarBooksInitial());

  final HomeRepo _homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(LoadingGetSimilarBooksData());
    var response = await _homeRepo.fetchSimilarBooks(category: category);

    response.fold((failure) {
      emit(FailureGetSimilarBooksData(failure.errorMessage));
    }, (books) {
      emit(SuccessGetSimilarBooksData(books));
    });
  }
}
