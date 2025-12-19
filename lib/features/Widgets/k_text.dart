import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const KText({
    super.key,
    required this.text,
    this.weight,
    this.fontSize,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
