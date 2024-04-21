import 'package:bookly_app/core/utils/routes_manager.dart';
import 'package:bookly_app/core/utils/styles_manager.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
// import 'package:bookly_app/features/home/presentation/views/widgets/book_item_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({
    super.key,
    required this.bookModel,
    // required this.bookRating,
    // required this.bookCount,
  });

  final BookModel bookModel;
  // final String bookRating;
  // final int bookCount;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          Routes.kBookDetailsView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: 125.0,
        child: Row(
          children: [
            CustomBookImageItem(
              bookImageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            // AspectRatio(
            //   // width:height
            //   aspectRatio: 2.7 / 4,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8.0),
            //       image: DecorationImage(
            //         fit: BoxFit.fill,
            //         image: NetworkImage(
            //           bookModel.volumeInfo.imageLinks.thumbnail,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      style: StylesManager.textStyle20,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    bookModel.volumeInfo.authors?[0] ?? 'Unkown Author',
                    style: StylesManager.textStyle14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: StylesManager.textStyle18,
                      ),
                      // BookItemRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
