import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:book_app/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(LoadingGetFeaturedBooksData());
    var response = await homeRepo.fetchFeatureBooks();
    response.fold((failure) {
      emit(FailureGetFeaturedBooksData(failure.errorMessage));
    }, (books) {
      emit(SuccessGetFeaturedBooksData(books));
    });
  }


}
