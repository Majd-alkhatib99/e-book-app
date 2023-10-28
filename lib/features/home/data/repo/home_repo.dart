import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures,List<BookModel>>> fetchFeatureBooks();

  Future<Either<Failures,List<BookModel>>> fetchNewestBooks();

  Future<Either<Failures,List<BookModel>>> fetchSimilarBooks({required String category});
}
