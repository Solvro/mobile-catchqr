import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/app_ui_config.dart';
import '../../../theme/app_theme.dart';

class ContactIconWidget extends StatelessWidget {
  const ContactIconWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://flutter.dev');

    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(_url)) {
          throw Exception('Could not launch $_url');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colorTheme.greyLight,
          borderRadius: AppUiConfig.borderRadious,
        ),
        child: Icon(
          Icons.ac_unit,
          color: context.colorTheme.orangePomegranade,
        ),
      ),
    );
  }
}
