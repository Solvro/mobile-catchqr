import 'package:catchqr/features/greeting_screen/widgets/informations_about_app_widget.dart';
import 'package:catchqr/features/greeting_screen/widgets/recetly_active_widget.dart';
import 'package:catchqr/utils/context_extensions.dart';
import 'package:catchqr/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'), //placeholder
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            InformationsAboutAppWidget(),
            SizedBox(height: 20),
            RecentlyActiveWidget(),
          ],
        )
      ),
    );// Everything here is temporary (to show widgets)
  }
}