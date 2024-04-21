import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var newestBooksData = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=art&Sorting=newest');
      List<BookModel> newestBooks = [];
      for (var newestBookItem in newestBooksData['items']) {
        newestBooks.add(BookModel.fromJson(newestBookItem));
      }
      return right(newestBooks);
    } catch (e) {
      // if status code is anything except 200
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var newestBooksData = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:art');
      List<BookModel> newestBooks = [];
      for (var newestBookItem in newestBooksData['items']) {
        newestBooks.add(BookModel.fromJson(newestBookItem));
      }
      return right(newestBooks);
    } catch (e) {
      // if status code is anything except 200
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchBooksYouMightLike({
    required String category,
  }) async {
    try {
      var newestBooksData = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:art');
      List<BookModel> newestBooks = [];
      for (var newestBookItem in newestBooksData['items']) {
        newestBooks.add(BookModel.fromJson(newestBookItem));
      }
      return right(newestBooks);
    } catch (e) {
      // if status code is anything except 200
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
