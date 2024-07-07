import 'package:catchqr/config/app_ui_config.dart';
import 'package:catchqr/theme/app_theme.dart';
import 'package:catchqr/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final int maxLinesToShow;
  final String content;

  const ExpandableTextWidget({
    super.key,
    required this.content,
    required this.maxLinesToShow,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  final ValueNotifier<bool> _expanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {

    final TextSpan textSpan = TextSpan(
      text: widget.content,
      style: context.textTheme.smallText
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: _expanded.value ? null : widget.maxLinesToShow,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    final int numberOfLines = textPainter.computeLineMetrics().length;
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
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (!_expanded.value && numberOfLines >= widget.maxLinesToShow) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.content,
                          maxLines: widget.maxLinesToShow,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.smallText,
                        ),
                        SeeMoreLessWidget(
                          textData: context.localize.see_more,
                          isSeeMore: true,
                          onSeeMoreLessTap: () {
                            _expanded.value = true;
                          },
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.content,
                          style: context.textTheme.smallText,
                        ),
                        if (_expanded.value && numberOfLines >= widget.maxLinesToShow)
                          SeeMoreLessWidget(
                            textData: context.localize.see_less,
                            isSeeMore: false,
                            onSeeMoreLessTap: () {
                              _expanded.value = false;
                            },
                          ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class SeeMoreLessWidget extends StatelessWidget {
  final String textData;
  final bool isSeeMore;
  final VoidCallback onSeeMoreLessTap;

  const SeeMoreLessWidget({
    super.key,
    required this.textData,
    required this.isSeeMore,
    required this.onSeeMoreLessTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: InkWell(
          onTap: () => onSeeMoreLessTap(),
          child: Text.rich(
            softWrap: true,
            style: context.textTheme.smallPomegradeText,
            textAlign: TextAlign.start,
            TextSpan(
              text: "",
              children: [
                TextSpan(
                  text: textData,
                  style:context.textTheme.smallPomegradeText,
                ),
                const WidgetSpan(
                  child: SizedBox(
                    width: 3.0,
                  ),
                ),
                WidgetSpan(
                  child: Icon(
                    isSeeMore ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                    color: context.colorTheme.orangePomegranade,
                    size: 17.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}