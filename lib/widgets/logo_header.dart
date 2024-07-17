import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/context_extensions.dart';

class LogoHeader extends SliverPersistentHeaderDelegate {
  LogoHeader({this.expandedHeight = 400, required this.onTap});

  final VoidCallback onTap;
  final double expandedHeight;

  ///Most of the function uses `shrinkOffset` to know exactly how much user scrolled down from the
  ///header. In logo position `shrinkOffset` is used to calculate fade and position on the screen,
  ///when in background widget it's used to calculate margin, so it would touch elements below,
  ///since logo will go up.

  //General
  double _opacityFadeVal(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  //Logo related
  double _logoTopPosition(double shrinkOffset) => expandedHeight / 3 - shrinkOffset;
  double _logoLeftPosition(BuildContext context) => MediaQuery.of(context).size.width / 4;
  double _logoSize(BuildContext context) => MediaQuery.of(context).size.width / 2;

  //Background related
  double get _bgHeight => expandedHeight * 0.7;
  double _bgBottomMargin(double shrinkOffset) =>
      clampDouble(expandedHeight * 0.3 - shrinkOffset, 0, double.infinity);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: _opacityFadeVal(shrinkOffset),
          child: Container(
            margin: EdgeInsets.only(bottom: _bgBottomMargin(shrinkOffset)),
            alignment: Alignment.centerLeft,
            child: Image.network( //TODO: replace placeholder.
              'https://i.cbc.ca/1.4357834.1542318134!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/old-man-senior-cell-phone-hand.jpg',
              height: _bgHeight,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.none,
            ),
          ),
        ),
        Positioned(
          top: _logoTopPosition(shrinkOffset),
          left: _logoLeftPosition(context),
          child: Opacity(
            opacity: _opacityFadeVal(shrinkOffset),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34),
              ),
              child: Container(
                height: _logoSize(context),
                width: _logoSize(context),
                decoration: BoxDecoration(
                  gradient: ColorsConsts.toPWRGradient,
                  borderRadius: BorderRadius.circular(34),
                ),
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
