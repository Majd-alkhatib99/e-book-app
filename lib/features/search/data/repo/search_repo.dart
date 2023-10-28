import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures,List<BookModel>>> fetchSearchResult({required String search});

}
