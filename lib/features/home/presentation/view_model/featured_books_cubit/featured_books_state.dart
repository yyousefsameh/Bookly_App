part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookModel> featuredBooksList;

  const FeaturedBooksSuccessState(this.featuredBooksList);
}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBooksFailureState(this.errorMessage);
}
