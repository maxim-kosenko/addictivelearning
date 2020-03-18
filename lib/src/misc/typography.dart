import 'package:addictivelearning/src/misc/dimens.dart';
import 'package:flutter/widgets.dart';

import 'misc.dart';


class CustomTypography {
  static const headline = TextStyle(
    color: CustomColors.primary,
    fontFamily: 'Open Sans',
    fontWeight: FontWeight.bold,
    fontSize: Dimensions.headlineSize,
    height: Dimensions.headlineHeight,
  );

  static const title = TextStyle(
    color: CustomColors.primary,
    fontFamily: 'Open Sans',
    fontSize: Dimensions.titleSize,
    height: Dimensions.titleHeight,
  );

  static const subhead = TextStyle(
    color: CustomColors.secondary,
    fontFamily: 'Open Sans',
    fontSize: Dimensions.subHeadSize,
    height: Dimensions.subHeadHeight,
  );

  static const body2 = TextStyle(
    color: CustomColors.primary,
    fontFamily: 'Open Sans',
    fontSize: Dimensions.body2Size,
    height: Dimensions.body2Height,
  );

  static const body1 = TextStyle(
    color: CustomColors.primary,
    fontFamily: 'Open Sans',
    fontSize: Dimensions.body1Size,
    height: Dimensions.body1Height,
  );

  static const caption = TextStyle(
    color: CustomColors.secondaryVariant,
    fontFamily: 'Open Sans',
    fontSize: Dimensions.captionSize,
    height: Dimensions.captionHeight,
  );

  static const button = TextStyle(
    color: CustomColors.white,
    fontFamily: 'Open Sans',
    fontSize: Dimensions.buttonSize,
    height: Dimensions.buttonHeight,
  );
}
