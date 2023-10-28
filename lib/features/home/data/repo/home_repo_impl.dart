import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/core/util/api_serves.dart';
import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:book_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failures, List<BookModel>>> fetchFeatureBooks() async {
    List<BookModel> books = [];
    try {
      var response = await ApiServes.getData(endPoint: 'books/v1/volumes?Filtering=free-ebooks&q=subject:programming');
      for(var items in response['items']){
        books.add(BookModel.fromJson(items));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }

      return left(ServerFailures(e.toString()));
    }
  }



  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    List<BookModel>books =[];
    try {
      final response = await ApiServes.getData(
          endPoint: 'books/v1/volumes?Filtering=free-ebooks&q=subject:computer science&Sorting=newest');
      for(var items in response['items']){
        books.add(BookModel.fromJson(items));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    List<BookModel> books = [];
    try {
      var response = await ApiServes.getData(endPoint: 'books/v1/volumes?Filtering=free-ebooks&q=subject:$category&sorting=relevance');
      for(var items in response['items']){
        books.add(BookModel.fromJson(items));

      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }

      return left(ServerFailures(e.toString()));
    }
  }
}
