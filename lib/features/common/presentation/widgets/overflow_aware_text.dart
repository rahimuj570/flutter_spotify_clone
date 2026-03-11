import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class OverflowAwareText extends StatelessWidget {
  final String text;
  final double maxWidth;
  final TextStyle? style;

  const OverflowAwareText({
    super.key,
    required this.text,
    required this.maxWidth,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    // Measure text width using TextPainter
    final TextPainter tp = TextPainter(
      text: TextSpan(
        text: text,
        style: style ?? DefaultTextStyle.of(context).style,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);

    final double textWidth = tp.size.width;

    if (textWidth <= maxWidth) {
      // Fits → just show normal text
      return SizedBox(
        width: maxWidth,
        child: Text(
          text,
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      // Overflows → show marquee
      return SizedBox(
        width: maxWidth,
        height: style?.fontSize != null ? style!.fontSize! * 1.5 : 20,
        child: Marquee(
          text: text,
          style: style,
          scrollAxis: Axis.horizontal,
          blankSpace: 20.0,
          velocity: 40.0,
          pauseAfterRound: const Duration(seconds: 1),
        ),
      );
    }
  }
}
