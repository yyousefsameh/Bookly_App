import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksInitialState());

  final SearchRepo searchRepo;
  Future<void> fetchBooksOfCertainCategory({
    required String category,
  }) async {
    emit(SearchedBooksLoadingState());
    var resultOfFetchingSearchedBooks =
        await searchRepo.fetchBooksOfCertainCategory(
      category: category,
    );
    resultOfFetchingSearchedBooks.fold(
      (failure) {
        emit(SearchedBooksFailureState(failure.errorMessage));
      },
      (searchedBooks) {
        emit(
          SearchedBooksSuccessState(searchedBooks),
        );
      },
    );
  }
}
