import 'package:bookly_app/core/utils/styles_manager.dart';
import 'package:bookly_app/features/search/presentation/view_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_resutls_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            // onChanged: (String? booksCategory)  {
            //   if (booksCategory != null) {
            //      BlocProvider.of<SearchedBooksCubit>(context)
            //         .fetchBooksOfCertainCategory(
            //       category: booksCategory,
            //     );
            //   }
            // },
            onSubmitted: (String? booksCategory) {
              if (booksCategory != null) {
                BlocProvider.of<SearchedBooksCubit>(context)
                    .fetchBooksOfCertainCategory(
                  category: booksCategory,
                );
              }
            },
            suffixIcon: const Opacity(
              opacity: .8,
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22.0,
              ),
            ),
            //  IconButton(
            //   onPressed: () {
            //     BlocProvider.of<SearchedBooksCubit>(context)
            //         .fetchBooksOfCertainCategory(
            //       category: booksCategory,
            //     );
            //   },
            //   icon: const Opacity(
            //     opacity: .8,
            //     child: Icon(
            //       FontAwesomeIcons.magnifyingGlass,
            //       size: 22.0,
            //     ),
            //   ),
            // ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            'Search Result',
            style: StylesManager.textStyle18,
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Expanded(
            child: SearchResulstListView(),
          ),
        ],
      ),
    );
  }
}
