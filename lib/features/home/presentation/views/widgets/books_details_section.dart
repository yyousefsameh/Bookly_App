import 'package:bookly_app/core/utils/font_manager.dart';
import 'package:bookly_app/core/utils/styles_manager.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_actions.dart';
// import 'package:bookly_app/features/home/presentation/views/widgets/book_item_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthOfScreen * .22),
          child: CustomBookImageItem(
            bookImageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 43.0,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: StylesManager.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          bookModel.volumeInfo.authors?[0] ?? 'Unknown Author',
          textAlign: TextAlign.center,
          style: StylesManager.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeightManager.medium,
          ),
        ),
        // const SizedBox(
        //   height: 18.0,
        // ),
        // const BookItemRating(
        //   rowMainAxisAlignment: MainAxisAlignment.center,
        // ),
        const SizedBox(height: 37.0),
        BookDetailsActions(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
