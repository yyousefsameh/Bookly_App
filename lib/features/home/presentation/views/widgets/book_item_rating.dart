import 'package:bookly_app/core/utils/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookItemRating extends StatelessWidget {
  const BookItemRating({
    super.key,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment rowMainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffffdd4f),
          size: 14.0,
        ),
        const SizedBox(
          width: 6.3,
        ),
        const Text(
          '4.8',
          style: StylesManager.textStyle16,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '(22222)',
            style: StylesManager.textStyle14.copyWith(),
          ),
        ),
      ],
    );
  }
}
