import 'package:bookly_app/core/utils/font_manager.dart';
import 'package:bookly_app/core/utils/styles_manager.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_you_might_like_list_view.dart';
import 'package:flutter/material.dart';

class BooksYouMightLikeSection extends StatelessWidget {
  const BooksYouMightLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'you can also like',
          style: StylesManager.textStyle14.copyWith(
            fontWeight: FontWeightManager.semiBold,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        const BooksYouMightLikeListView(),
      ],
    );
  }
}
