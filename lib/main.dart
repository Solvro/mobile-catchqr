import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/greeting_screen/greeting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/points_list_screen/points_list_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        extensions: const [AppTheme()],
        colorScheme: const ColorScheme.light().copyWith(
            surface: Colors.white,
          ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const GreetingScreen(),
      //home: const PointsListScreen(), //You can view the PointsListScreen by uncommenting this line and commenting out the previous line
    );
  }
}