import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import 'colors.dart';

class BodyTextStyle extends TextStyle {
  const BodyTextStyle({
    super.fontWeight = FontWeight.w400,
    super.fontSize = 13.0,
    super.color = ColorsConsts.blackMirage,
    super.height = 1.2,
    super.shadows,
  }) : super(
          fontFamily: FontFamily.rubik,
          letterSpacing: 0,
        );
}

class BoldBodyTextStyle extends BodyTextStyle {
  const BoldBodyTextStyle({super.fontSize, super.color})
      : super(fontWeight: FontWeight.w500);
}

class HeadlineTextStyle extends BoldBodyTextStyle {
  const HeadlineTextStyle({super.color}) : super(fontSize: 19);
}

class SmallBoldTextStyle extends BoldBodyTextStyle {
  const SmallBoldTextStyle({super.color}) : super(fontSize: 14);
}

class SmallTextStyle extends BodyTextStyle {
  const SmallTextStyle({super.color}) : super(fontSize: 14);
}

class MediumBoldTextStyle extends BoldBodyTextStyle {
  const MediumBoldTextStyle({super.color}) : super(fontSize: 16);
}