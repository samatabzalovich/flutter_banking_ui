
import 'package:flutter/material.dart';

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return route;
          },
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
      opacity: animation,
      child: child,
    );
          },
        );
}