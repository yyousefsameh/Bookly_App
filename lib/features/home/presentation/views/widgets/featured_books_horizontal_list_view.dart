import 'package:bookly_app/core/utils/routes_manager.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/cutom_loading_indicator_widget.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksHorizontalListView extends StatelessWidget {
  const FeaturedBooksHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      Routes.kBookDetailsView,
                      extra: state.featuredBooksList[index],
                    );
                  },
                  child: CustomBookImageItem(
                    bookImageUrl: state.featuredBooksList[index].volumeInfo
                            .imageLinks?.thumbnail ??
                        '',
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 18.0,
                ),
                itemCount: state.featuredBooksList.length,
              ),
            ),
          );
        } else if (state is FeaturedBooksFailureState) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        }
        return const CustomLoadingIndicatorWidget();
      },
    );
  }
}
