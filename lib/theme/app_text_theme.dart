import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'colors.dart';
import 'typography.dart';

part 'app_text_theme.tailor.dart';

@tailorMixinComponent
class AppTextTheme extends ThemeExtension<AppTextTheme>
    with _$AppTextThemeTailorMixin {
  const AppTextTheme({
    // Headline 19px, w500
    this.headline = const HeadlineTextStyle(),
    
    // SmallText 14px, w400
    this.smallText = const SmallTextStyle(),

    // SmallBoldText 14px, w500
    this.smallBoldText = const SmallBoldTextStyle(),

    // MediumBoldText 16px, w500
    this.mediumBoldText = const MediumBoldTextStyle(),
    this.mediumGrayBoldText = const MediumBoldTextStyle(color: ColorsConsts.greyLight)
  });
  
  
  @override
  final TextStyle headline;
  @override
  final TextStyle smallText;
  @override
  final TextStyle smallBoldText;
  @override
  final TextStyle mediumBoldText;
  @override
  final TextStyle mediumGrayBoldText;
  
}