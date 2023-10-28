import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import '../../../data/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this._homeRepo) : super(NewestBooksInitial());

  final HomeRepo _homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(LoadingGetNewestBooksData());
    var response = await _homeRepo.fetchNewestBooks();
    response.fold((failure) {
      emit(FailureGetNewestBooksData(failure.errorMessage));
    }, (books) {
      emit(SuccessGetNewestBooksData(books));
    });
  }
}
