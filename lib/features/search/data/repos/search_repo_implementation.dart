import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBooksOfCertainCategory({
    required String category,
  }) async {
    try {
      var newestBooksData =
          await apiService.get(endPoint: 'volumes?q=$category');
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
