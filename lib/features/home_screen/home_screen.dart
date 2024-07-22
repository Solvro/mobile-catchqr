import 'package:flutter/material.dart';

import '../../utils/context_extensions.dart';
import '../../widgets/join_game_widget.dart';
import 'widgets/contact_widget.dart';
import 'widgets/game_description_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //This is just temporary, i guess urls to social media will be passed in some different way
  final List<String> urls = [
    "https://www.instagram.com/knsolvro/",
    "https://pl.linkedin.com/company/knsolvro",
    "kn.solvro@pwr.edu.pl",
    "https://www.facebook.com/knsolvro",
    "https://solvro.pwr.edu.pl/"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), //placeholder
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const GameDescriptionWidget(
                  content:
                      "To jest przykładowy opis gry, patrzcie jak się ładnie wyświetla"),
              const SizedBox(height: 20),
              ContactWidget(
                urls: urls,
              ),
              const SizedBox(height: 20),
              JoinGameWidget(
                title: context.localize.your_team,
                description: context.localize.enter_team_name,
                pressFunction: () {
                  print("entering game functionality");
                },
              ),
            ],
          )),
    ); // Everything here is temporary (to show widgets)
  }
}
