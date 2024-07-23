import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/context_extensions.dart';
import '../../widgets/join_game_widget.dart';
import '../../widgets/logo_header.dart';
import '../home_screen/widgets/game_description_widget.dart';
import 'widgets/informations_about_app_widget.dart';
import 'widgets/recetly_active_widget.dart';

class GreetingScreen extends StatefulWidget {
  const GreetingScreen({super.key});

  @override
  State<GreetingScreen> createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool isHomeHeader = true;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: isHomeHeader ? LogoHeader(
                onTap: () {},
              ) : LogoHeader.rounded(() {}),
              pinned: true,
            ),
            SliverToBoxAdapter(
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
                      if (kDebugMode)
                        _DebugWidgets(
                          isHomeHeader: isHomeHeader,
                          onSwitch: (val) {
                            setState(() {
                              isHomeHeader = val;
                            });
                          },
                        ),
                    ],
                  )),
            )
          ],
        ),
      ),
    ); // Everything here is temporary (to show widgets)
  }
}

class _DebugWidgets extends StatelessWidget {
  const _DebugWidgets({required this.isHomeHeader, required this.onSwitch});

  final bool isHomeHeader;
  final Function(bool) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Switch header'),
          trailing: Switch(value: isHomeHeader, onChanged: onSwitch),
        ),
        const SizedBox(
          height: 1000,
        ), //Needed to check scroll properly
      ],
    );
  }
}
