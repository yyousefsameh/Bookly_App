import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._homeRepo) : super(FeaturedBooksInitialState());

  final HomeRepo _homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var resultOfFetchingFeaturedBooks = await _homeRepo.fetchFeaturedBooks();

    resultOfFetchingFeaturedBooks.fold(
      (failure) {
        emit(FeaturedBooksFailureState(failure.errorMessage));
      },
      (featuredBooks) {
        emit(
          FeaturedBooksSuccessState(featuredBooks),
        );
      },
    );
  }
}
