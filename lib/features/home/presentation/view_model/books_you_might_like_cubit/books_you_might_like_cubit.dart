import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'books_you_might_like_state.dart';

class BooksYouMightLikeCubit extends Cubit<BooksYouMightLikeState> {
  BooksYouMightLikeCubit(this.homeRepo)
      : super(BooksYouMightLikeInitialState());

  final HomeRepo homeRepo;

  Future<void> fetchBooksYouMightLike({
    required String category,
  }) async {
    emit(BooksYouMightLikeLoadingState());
    var resultOfFetchingFeaturedBooks = await homeRepo.fetchBooksYouMightLike(
      category: category,
    );
    resultOfFetchingFeaturedBooks.fold(
      (failure) {
        emit(BooksYouMightLikeFailureState(failure.errorMessage));
      },
      (booksYouMightLike) {
        emit(
          BooksYouMightLikeSuccessState(booksYouMightLike),
        );
      },
    );
  }
}
