import 'package:bookly_app/core/utils/styles_manager.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/cutom_loading_indicator_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/view_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResulstListView extends StatelessWidget {
  const SearchResulstListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccessState) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => BooksListViewItem(
              bookModel: state.searchedBooksList[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20.0,
            ),
            itemCount: state.searchedBooksList.length,
          );
        } else if (state is SearchedBooksFailureState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchedBooksLoadingState) {
          return const CustomLoadingIndicatorWidget();
        }
        return const Center(
          child: Text(
            "Please search for some books",
            style: StylesManager.textStyle18,
          ),
        );
      },
    );
  }
}
