import 'package:flutter/material.dart';

Paint getPaintForCircle(Offset offset, double radius) {
    final gradient = const LinearGradient(
      colors: [
        Color(0xfffa656a),
        Color(0xffa58afd),
        Color(0xfff08cc4),
      ], // Replace with your colors
      stops: [0.0, 0.5, 1.5], // Adjust stops as needed
    ).createShader(Rect.fromCircle(center: offset, radius: radius));

    final paint = Paint()..shader = gradient;
    return paint;
  }