import 'package:catchqr/features/home_view/widgets/recetly_active_section.dart';
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
        child: RecentlyActiveWidget(),
      ),
      
    );
  }
}