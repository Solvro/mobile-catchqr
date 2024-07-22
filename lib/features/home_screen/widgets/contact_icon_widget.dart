import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/app_ui_config.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/launch_url_util.dart';

class ContactIconWidget extends StatelessWidget {
  const ContactIconWidget(
      {super.key, required this.url, required this.socialMediaName});

  final String url;
  final String socialMediaName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String formattedUrl = url;
        if (socialMediaName == "mail") {
          final Uri params = Uri(
            scheme: 'mailto',
            path: url,
          );
          formattedUrl = params.toString();
        }
        LaunchUrlUtil.launch(formattedUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colorTheme.greyLight,
          borderRadius: AppUiConfig.borderRadious,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset("assets/icons/$socialMediaName.svg"),
        ),
      ),
    );
  }
}
