import 'package:catchqr/theme/app_theme.dart';
import 'package:catchqr/utils/context_extensions.dart';
import 'package:catchqr/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class GameDescriptionWidget extends StatelessWidget {
  const GameDescriptionWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        Text(
          context.localize.game_description,
          style: context.textTheme.headline,
        ),

        const SizedBox(height: 15),

        ExpandableTextWidget(
          content: content,
          maxLinesToShow: 3,
        )
      ],
    );
  }
}