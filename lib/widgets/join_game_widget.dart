import 'package:flutter/material.dart';

import '../../../utils/context_extensions.dart';
import '../config/app_ui_config.dart';
import '../theme/app_theme.dart';
import '../theme/colors.dart';

class JoinGameWidget extends StatelessWidget {
  const JoinGameWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.pressFunction});

  final String title;
  final String description;
  final VoidCallback pressFunction;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: context.textTheme.headline),
      const SizedBox(
        height: 18.0,
      ),
      TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: context.colorTheme.greyLight,
          hintText: description,
          hintStyle: TextStyle(color: context.colorTheme.greyHintColor),
          border: const OutlineInputBorder(
            borderRadius: AppUiConfig.borderRadious,
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(
          color: context.colorTheme.blackMirage,
        ),
      ),
      const SizedBox(
        height: 12.0,
      ),
      Center(
        child: TextButton(
          onPressed: pressFunction,
          child: Container(
            decoration: const BoxDecoration(
              color: ColorsConsts.orangePomegranate,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
              child: Text(
                context.localize.start_game,
                style: const TextStyle(color: ColorsConsts.whiteSoap),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
