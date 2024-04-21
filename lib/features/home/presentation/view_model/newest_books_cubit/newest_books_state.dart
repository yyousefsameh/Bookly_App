part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitialState extends NewestBooksState {}

final class NewestBooksLoadingState extends NewestBooksState {}

final class NewestBooksSuccessState extends NewestBooksState {
  final List<BookModel> newestBooksList;

  const NewestBooksSuccessState(this.newestBooksList);
}

final class NewestBooksFailureState extends NewestBooksState {
  final String errorMessage;

  const NewestBooksFailureState(this.errorMessage);
}
