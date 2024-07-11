import '../config/app_ui_config.dart';
import '../theme/app_theme.dart';
import '../utils/context_extensions.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatelessWidget {
  final int maxLinesToShow;
  final String content;

  ExpandableTextWidget({
    super.key,
    required this.content,
    required this.maxLinesToShow,
  });

  final ValueNotifier<bool> _expanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {

    final TextSpan textSpan = TextSpan(
      text: content,
      style: context.textTheme.smallText
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: _expanded.value ? null : maxLinesToShow,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    final int numberOfLines = textPainter.computeLineMetrics().length;

    void onSeeMoreLessTap() {
      _expanded.value = !_expanded.value;
    }

    return ValueListenableBuilder(
      valueListenable: _expanded,
      builder: (context, values, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorTheme.greyLight,
                borderRadius: AppUiConfig.borderRadious,
              ),
              child: _SeeMoreLessWidget(
                isSeeMore:_expanded.value,
                onSeeMoreLessTap: onSeeMoreLessTap,
                content: content,
                maxLinesToShow: maxLinesToShow,
                numberOfLines: numberOfLines,
              )
            ),
          ],
        );
      },
    );
  }
}

class _SeeMoreLessWidget extends StatelessWidget {
  final bool isSeeMore;
  final VoidCallback onSeeMoreLessTap;
  final String content;
  final int maxLinesToShow;
  final int numberOfLines;

  const _SeeMoreLessWidget({
    required this.isSeeMore,
    required this.onSeeMoreLessTap,
    required this.content,
    required this.maxLinesToShow,
    required this.numberOfLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content,
          maxLines: isSeeMore ? null : maxLinesToShow,
          overflow: isSeeMore ? null : TextOverflow.ellipsis,
          style: context.textTheme.smallText,
        ),
        if(numberOfLines >= maxLinesToShow)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: InkWell(
                onTap: () => onSeeMoreLessTap(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isSeeMore ? context.localize.see_less : context.localize.see_more,
                      style: context.textTheme.smallPomegradeText,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      width: 3.0,
                    ),
                    Icon(
                      isSeeMore ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: context.colorTheme.orangePomegranade,
                      size: 17.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}