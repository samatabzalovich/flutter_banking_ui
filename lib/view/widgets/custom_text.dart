import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;
  final double? textHeight;
  const CustomText(this.text,
      {this.color = Colors.white,
      this.fontSize = 12,
      this.fontWeight = FontWeight.normal,
      this.align = TextAlign.left, this.textHeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: textHeight
      ),
    );
  }
}
