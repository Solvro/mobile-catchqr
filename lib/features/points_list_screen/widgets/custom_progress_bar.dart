import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomProgressBar extends ConsumerWidget {

  const CustomProgressBar({
    super.key,
    required this.height,
    required this.value,
    required this.backgroundColor,
    required this.color,
    this.borderRadius = BorderRadius.zero,
    this.text = "", 
    this.textStyle
  });

  final double height;
  final double value;
  final Color? backgroundColor;
  final Color? color;
  final BorderRadiusGeometry borderRadius;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height + 4,
          decoration: const BoxDecoration(
            color: Colors.white,
          )
        ),
        LinearProgressIndicator(
          backgroundColor: backgroundColor,
          color: color,
          borderRadius: borderRadius,
          minHeight: height,
          value: value,
        ),
        Text(
          text,
          style: textStyle,
        )
      ],
    );
  }
}