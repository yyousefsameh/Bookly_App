import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this._homeRepo) : super(NewestBooksInitialState());

  final HomeRepo _homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());

    var resultOfFetchingNewestBooks = await _homeRepo.fetchNewestBooks();
    resultOfFetchingNewestBooks.fold(
      (failure) {
        emit(
          NewestBooksFailureState(failure.errorMessage),
        );
      },
      (newestBooks) {
        emit(
          NewestBooksSuccessState(newestBooks),
        );
      },
    );
  }
}
