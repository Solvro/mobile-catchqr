import 'package:catchqr/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_color_theme.tailor.dart';

@TailorMixinComponent()
class AppColorTheme extends ThemeExtension<AppColorTheme>
    with _$AppColorThemeTailorMixin {
  const AppColorTheme({
    this.blackMirage = ColorsConsts.blackMirage,
    this.whiteSoap = ColorsConsts.whiteSoap,
    this.orangePomegranade = ColorsConsts.orangePomegranade,
    this.greyLight = ColorsConsts.greyLight,
    this.grey = ColorsConsts.grey,
  });
  
  @override
  final Color blackMirage;

  @override
  final Color whiteSoap;

  @override
  final Color orangePomegranade;

  @override
  final Color greyLight;

  @override
  final Color grey;
}