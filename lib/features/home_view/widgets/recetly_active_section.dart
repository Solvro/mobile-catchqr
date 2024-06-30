import 'package:catchqr/theme/app_theme.dart';
import 'package:catchqr/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class RecentlyActiveWidget extends StatelessWidget {
  const RecentlyActiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localize.recently_active,
          style: context.textTheme.headline,
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.separated(
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return RecentlyActiveGameWidget(
                gameName: 'Gra $index',
                onTap: () {
                  // Navigate to the game
                },
              );
          }),
        ),
      ],
    );
  }
}

class RecentlyActiveGameWidget extends StatelessWidget {
  const RecentlyActiveGameWidget({
    super.key, 
    required this.gameName,
    required this.onTap
  });

  final String gameName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorTheme.greyLight,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                gameName,
                style: context.textTheme.smallBoldText,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colorTheme.grey.withOpacity(0.13),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: context.colorTheme.orangePomegranade,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}