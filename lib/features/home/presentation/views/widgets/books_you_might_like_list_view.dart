import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/cutom_loading_indicator_widget.dart';
import 'package:bookly_app/features/home/presentation/view_model/books_you_might_like_cubit/books_you_might_like_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksYouMightLikeListView extends StatelessWidget {
  const BooksYouMightLikeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksYouMightLikeCubit, BooksYouMightLikeState>(
      builder: (context, state) {
        if (state is BooksYouMightLikeSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CustomBookImageItem(
                bookImageUrl: state.booksYouMightLikeList[index].volumeInfo
                        .imageLinks?.thumbnail ??
                    '',
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10.0,
              ),
              itemCount: state.booksYouMightLikeList.length,
            ),
          );
        } else if (state is BooksYouMightLikeFailureState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicatorWidget();
        }
      },
    );
  }
}
