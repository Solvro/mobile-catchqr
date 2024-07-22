import 'package:flutter/material.dart';

import '../../../constants/social_media.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/context_extensions.dart';
import 'contact_icon_widget.dart';

class ContactWidget extends StatelessWidget {
  ContactWidget({super.key, required this.urls});

  final List<String> urls;
  @override
  Widget build(BuildContext context) {
    List<Widget> contactWidgets = List.generate(urls.length, (index) {
      return ContactIconWidget(
        url: urls[index],
        socialMediaName: socialMedia[index],
      );
    });

    for (int i = 1; i < contactWidgets.length; i = i + 2) {
      contactWidgets.insert(i, const Spacer());
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        context.localize.contact,
        style: context.textTheme.headline,
      ),
      const SizedBox(height: 15.0),
      Row(
        children: contactWidgets,
      ),
    ]);
  }
}
