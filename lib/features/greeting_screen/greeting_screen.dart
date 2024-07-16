import 'package:flutter/material.dart';

import '../../utils/context_extensions.dart';
import '../../widgets/join_game_widget.dart';
import 'widgets/informations_about_app_widget.dart';
import 'widgets/recetly_active_widget.dart';

class GreetingScreen extends StatefulWidget {
  const GreetingScreen({super.key});

  @override
  State<GreetingScreen> createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), //placeholder
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const InformationsAboutAppWidget(),
                const SizedBox(height: 20),
                JoinGameWidget(
                  title: context.localize.join_game,
                  description: context.localize.enter_code,
                  controller: _codeController,
                  pressFunction: () {
                    print("entering game functionality");
                  },
                ),
                const SizedBox(height: 20),
                const RecentlyActiveWidget(),
              ],
            )),
      ),
    ); // Everything here is temporary (to show widgets)
  }
}
