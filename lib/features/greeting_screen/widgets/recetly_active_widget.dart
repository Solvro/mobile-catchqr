import '../../../config/app_ui_config.dart';
import '../../../config/recently_active_config.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/context_extensions.dart';
import 'package:flutter/material.dart';

class RecentlyActiveWidget extends StatelessWidget {
  const RecentlyActiveWidget({super.key});

  final int itemCount = 5;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localize.recently_active,
            style: context.textTheme.headline,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              itemCount: itemCount,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return RecentlyActiveGameWidget(
                  gameName: '${context.localize.game} $index',
                  onTap: () {
                    // Navigate to the game
                  },
                );
            }),
          ),
        ],
      ),
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
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorTheme.greyLight,
          borderRadius: AppUiConfig.borderRadious,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: RecentlyActiveConfig.padding,
              child: Text(
                gameName,
                style: context.textTheme.smallBoldText,
              ),
            ),
            Container(
              padding: RecentlyActiveConfig.padding,
              decoration: BoxDecoration(
                color: context.colorTheme.grey.withOpacity(0.08),
                borderRadius: const BorderRadius.only(
                  topRight: AppUiConfig.radius,
                  bottomRight: AppUiConfig.radius,
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