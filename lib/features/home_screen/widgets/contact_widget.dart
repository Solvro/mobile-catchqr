import 'package:flutter/material.dart';

import '../../../utils/context_extensions.dart';
import 'contact_icon_widget.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(context.localize.contact),
      const SizedBox(height: 15.0),
      ListView.builder(
        itemBuilder: (context, index) {
          return ContactIconWidget(url: "item $index");
        },
      )
    ]);
  }
}

const socialMediaIcons = [];
