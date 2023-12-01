import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  const TextWidget(
      {super.key,
      this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.maxLines,
      this.textAlign,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? "",
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow));
  }
}
