import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassEffect extends StatelessWidget {
  final Widget child;

  FrostedGlassEffect({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 136, 136, 136), width: 0.8),
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.4),
              ),
      child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: child,
        ),
      ),
    );
  }
}