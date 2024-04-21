part of 'searched_books_cubit.dart';

sealed class SearchedBooksState extends Equatable {
  const SearchedBooksState();

  @override
  List<Object> get props => [];
}

final class SearchedBooksInitialState extends SearchedBooksState {}

final class SearchedBooksSuccessState extends SearchedBooksState {
  final List<BookModel> searchedBooksList;

  const SearchedBooksSuccessState(this.searchedBooksList);
}

final class SearchedBooksLoadingState extends SearchedBooksState {}

final class SearchedBooksFailureState extends SearchedBooksState {
  final String errorMessage;

  const SearchedBooksFailureState(this.errorMessage);
}
