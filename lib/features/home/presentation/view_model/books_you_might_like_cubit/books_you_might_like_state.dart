part of 'books_you_might_like_cubit.dart';

abstract class BooksYouMightLikeState extends Equatable {
  const BooksYouMightLikeState();

  @override
  List<Object> get props => [];
}

final class BooksYouMightLikeInitialState extends BooksYouMightLikeState {}

final class BooksYouMightLikeSuccessState extends BooksYouMightLikeState {
  final List<BookModel> booksYouMightLikeList;

  const BooksYouMightLikeSuccessState(this.booksYouMightLikeList);
}

final class BooksYouMightLikeLoadingState extends BooksYouMightLikeState {}

final class BooksYouMightLikeFailureState extends BooksYouMightLikeState {
  final String errorMessage;

  const BooksYouMightLikeFailureState(this.errorMessage);
}
