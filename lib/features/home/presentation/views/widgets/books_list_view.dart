import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/cutom_loading_indicator_widget.dart';
// import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: ListView.separated(
              // to make the listview take the height of it's childern
              // shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => BooksListViewItem(
                bookModel: state.newestBooksList[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
              itemCount: state.newestBooksList.length,
            ),
          );
        } else if (state is NewestBooksFailureState) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        }
        return const CustomLoadingIndicatorWidget();
      },
    );
  }
}
