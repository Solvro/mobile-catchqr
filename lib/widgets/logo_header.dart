import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/context_extensions.dart';

class LogoHeader extends SliverPersistentHeaderDelegate {
  LogoHeader({this.expandedHeight = 400, required this.onTap});

  VoidCallback onTap;
  double expandedHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Container(
            margin: EdgeInsets.only(
                bottom: clampDouble(expandedHeight * 0.3 - shrinkOffset, 0, double.infinity)),
            alignment: Alignment.centerLeft,
            child: Image.network( //TODO: replace placeholder.
              'https://i.cbc.ca/1.4357834.1542318134!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/old-man-senior-cell-phone-hand.jpg',
              height: expandedHeight * 0.7,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.none,
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 3 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34),
              ),
              child: Container(
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    gradient: ColorsConsts.toPWRGradient, borderRadius: BorderRadius.circular(34)),
                child: const Center(
                  child: Text(
                    'CatchQR',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: ColorsConsts.whiteSoap,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: onTap,
              child: Text(
                context.localize.organizer_login,
                style: const TextStyle(color: ColorsConsts.orangePomegranate),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
