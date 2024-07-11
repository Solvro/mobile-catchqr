import '../../../theme/app_theme.dart';
import '../../../utils/context_extensions.dart';
import '../../../widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class InformationsAboutAppWidget extends StatelessWidget {
  const InformationsAboutAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        Text(
          context.localize.informations_about_app,
          style: context.textTheme.headline,
        ),
        const SizedBox(height: 15),
        ExpandableTextWidget(
          content: context.localize.informations_about_app_content,
          maxLinesToShow: 4,
        ),
      ],
    );
  }
}