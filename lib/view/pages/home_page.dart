// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_banking_ui/enum/transaction.dart';
import 'package:flutter_banking_ui/utils/get_pain.dart';
import 'package:flutter_banking_ui/view/widgets/ball_painter.dart';
import 'package:flutter_banking_ui/view/widgets/card_slider.dart';
import 'package:flutter_banking_ui/view/widgets/custom_scaffold.dart';
import 'package:flutter_banking_ui/view/widgets/custom_text.dart';
import 'package:flutter_banking_ui/view/widgets/frosted_glass_container.dart';
import 'package:flutter_banking_ui/view/widgets/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  DraggableScrollableController controller = DraggableScrollableController();
  late AnimationController _animationController;
  late Animation<double> _circleAnimation;
  late Animation<double> _scaleAnimation;
  final PageController _pageController = PageController(viewportFraction: 0.9);
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print(_pageController.page); // TODO: page controller circle animation
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _circleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithBottomBar(
      isBottomNavVisible: true,
      body: AnimatedBuilder(
          animation: _animationController,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 27, top: 65, bottom: 32),
                      child: CustomText(
                        'Cards',
                        align: TextAlign.left,
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      )),
                  CardSlider(
                    pageController: _pageController,
                  ),
                ],
              ),
              ModalBottomSheet(),
              // ElevatedButton(
              //     onPressed: () {
              //       if (_animationController.isCompleted ||
              //           _animationController.isAnimating) {
              //         _animationController.reverse();
              //       } else {
              //         _animationController.forward();
              //       }
              //     },
              //     child: Text("ssss"))
            ],
          ),
          builder: (context, widget) {
            return CustomPaint(
                painter: BouncingBallPainter(
                  circleProgress: _circleAnimation.value,
                  scaleProgress: _scaleAnimation.value,
                ),
                child: widget);
          }),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  BouncingBallPainter({
    required this.circleProgress,
    required this.scaleProgress,
  });
  final double circleProgress;
  final double scaleProgress;
  @override
  void paint(Canvas canvas, Size size) {
    drawFirstCircle(size, canvas);
    drawSecondCircle(size, canvas);
    drawThirdCircle(size, canvas);
    drawRoundedRectangle(size, canvas);
  }

  void rotate(
      {required Canvas canvas,
      required double cx,
      required double cy,
      required double angle}) {
    canvas.translate(cx, cy);
    canvas.rotate(angle);
    canvas.translate(-cx, -cy);
  }

  void drawFirstCircle(Size size, Canvas canvas) {
    final circle1X = size.width + 10 - (circleProgress * 50);
    final circle1Y = size.height * 0.15 + (circleProgress * size.height / 2.7);
    canvas.drawCircle(
      Offset(circle1X, circle1Y),
      28 * scaleProgress,
      getPaintForCircle(Offset(circle1X, circle1Y), 28 * scaleProgress),
    );
  }

  void drawSecondCircle(Size size, Canvas canvas) {
    final circle2X = size.width - (circleProgress * size.width / 1.2);
    final circle2Y = size.height * 0.43 - (circleProgress * size.height / 4.2);
    canvas.drawCircle(
      Offset(circle2X, circle2Y),
      28 * scaleProgress, // Adjust the radius based on scale
      getPaintForCircle(Offset(circle2X, circle2Y), 28 * scaleProgress),
    );
  }

  void drawThirdCircle(Size size, Canvas canvas) {
    final circle3X = size.width * 0.8 - (circleProgress * (size.width / 9));
    final circle3Y =
        (-size.height * 0.2) + (circleProgress * size.height / 2.3); //-
    canvas.drawCircle(
      Offset(circle3X, circle3Y),
      42, // Adjust the radius based on scale
      getPaintForCircle(Offset(circle3X, circle3Y), 42),
    );
  }

  void drawRoundedRectangle(Size size, Canvas canvas) {
    final circleX = (-size.width * 0.4) + (circleProgress * size.width / 2);
    final circleY = (size.height) - (circleProgress * size.height / 1.8);
    const radiusRect = 111.0;
    final rect = Rect.fromCircle(
        center: Offset(circleX, circleY),
        radius: 111); // Adjust the radius as needed
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(80));
    canvas.save();
    rotate(
        canvas: canvas,
        cx: size.width * 0.1,
        cy: size.height / 2,
        angle: 1.4); //angle reduces, height /2.1
    canvas.drawRRect(
        rRect, getPaintForCircle(Offset(circleX, circleY), radiusRect));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
