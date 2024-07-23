import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/context_extensions.dart';

class LogoHeader extends SliverPersistentHeaderDelegate {
  LogoHeader({
    this.expandedHeight = 400,
    required this.onTap,
    this.buttonAlignment = Alignment.topRight,
  });

  factory LogoHeader.rounded(VoidCallback onBack) {
    return LogoHeader(
      onTap: onBack,
      expandedHeight: 250,
      buttonAlignment: Alignment.topLeft,
    );
  }

  final VoidCallback onTap;
  final double expandedHeight;
  final Alignment buttonAlignment;

  bool get _isRounded => buttonAlignment == Alignment.topLeft;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    ///Most of the variables uses `shrinkOffset` to know exactly how much user scrolled down from
    /// the header. In logo position `shrinkOffset` is used to calculate fade and position on the
    /// screen, when in background widget it's used to calculate margin, so it would touch elements
    /// below, since logo will go up.

    //General
    double opacityFadeVal = 1 - shrinkOffset / expandedHeight;

    //Logo related
    double logoTopPosition =
        _isRounded ? expandedHeight / 3.5 - shrinkOffset : expandedHeight / 3 - shrinkOffset;

    double logoLeftPosition = _isRounded
        ? MediaQuery.of(context).size.width * 0.3
        : MediaQuery.of(context).size.width / 4;

    double logoSize = _isRounded
        ? MediaQuery.of(context).size.width * 0.4
        : MediaQuery.of(context).size.width / 2;

    //Background related
    double bgHeight = expandedHeight * 0.7;

    double bgBottomMargin = clampDouble(expandedHeight * 0.3 - shrinkOffset, 0, double.infinity);

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: opacityFadeVal,
          child: Container(
            margin: EdgeInsets.only(bottom: bgBottomMargin),
            alignment: Alignment.centerLeft,
            child: Image.network(
              //TODO: replace placeholder.
              'https://i.cbc.ca/1.4357834.1542318134!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/old-man-senior-cell-phone-hand.jpg',
              height: bgHeight,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.none,
            ),
          ),
        ),
        Positioned(
          top: logoTopPosition,
          left: logoLeftPosition,
          child: Opacity(
            opacity: opacityFadeVal,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_isRounded ? logoSize : 34),
              ),
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: logoSize,
                  width: logoSize,
                  decoration: BoxDecoration(
                    gradient: ColorsConsts.toPWRGradient,
                    borderRadius: BorderRadius.circular(_isRounded ? logoSize : 34),
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
        ),
        AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          alignment: buttonAlignment,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: onTap,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isRounded)
                    const Icon(
                      Icons.chevron_left,
                      color: ColorsConsts.orangePomegranate,
                    ),
                  Text(
                    _isRounded ? context.localize.back : context.localize.organizer_login,
                    style: const TextStyle(color: ColorsConsts.orangePomegranate),
                  ),
                ],
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
