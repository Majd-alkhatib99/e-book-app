import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/core/util/api_serves.dart';
import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:book_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchResult(
      {required String search}) async {
    List<BookModel> books = [];
    try {
      var response = await ApiServes.getData(
          endPoint:
              'books/v1/volumes?Filtering=free-ebooks&q=subject:$search&sorting=relevance');
      for (var items in response['items']) {
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
