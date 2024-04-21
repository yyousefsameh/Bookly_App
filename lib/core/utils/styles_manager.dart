import 'package:bookly_app/core/utils/font_manager.dart';
import 'package:flutter/cupertino.dart';

abstract class StylesManager {
  static const textStyle14 = TextStyle(
    fontSize: FontSizeManager.fontSize14,
    fontWeight: FontWeight.normal,
  );
  static const textStyle16 = TextStyle(
    fontSize: FontSizeManager.fontSize16,
    fontWeight: FontWeightManager.medium,
  );
  static const textStyle18 = TextStyle(
    fontSize: FontSizeManager.fontSize18,
    fontWeight: FontWeightManager.semiBold,
  );
  static const textStyle20 = TextStyle(
    fontSize: FontSizeManager.fontSize20,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontFamilyManager.fontFamilyGtSectraFine,
  );
  static const textStyle30 = TextStyle(
    fontSize: FontSizeManager.fontSize30,
    fontWeight: FontWeight.w900,
    fontFamily: FontFamilyManager.fontFamilyGtSectraFine,
    letterSpacing: 1.2,
  );
}

const TextStyle textStyle = TextStyle();
