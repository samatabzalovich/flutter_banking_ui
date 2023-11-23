// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter_banking_ui/utils/get_pain.dart';
import 'package:flutter_banking_ui/view/widgets/custom_text.dart';
import 'package:flutter_banking_ui/view/widgets/frosted_glass_container.dart';

class CardSlider extends StatefulWidget {
  final PageController pageController;
  const CardSlider({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  final cardCount = 4;
  late double _height;
  late bool isPadEnds;
  var _curPageValue = 0.0;
  double _scaleFactor = 0.8;
  @override
  void initState() {
    super.initState();
    isPadEnds = false;
    widget.pageController.addListener(() {
      setState(() {
        if (widget.pageController.page! > cardCount - 1.5) {
          isPadEnds = true;
        } else {
          isPadEnds = false;
        }

        _curPageValue = widget.pageController.page!;
      });
    });
  }
  

  Widget _buildTransformedPageItem(
      int index, BuildContext context, double height, Widget child) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _curPageValue.floor()) {
      var currScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _curPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_curPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _curPageValue.floor() - 1) {
      var currScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);

      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - _scaleFactor) / 2, 0);
      ;
    }
    return Transform(
      transform: matrix,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height / 4;
    return Column(
      children: [
        SizedBox(
          height: _height,
          child: PageView.builder(
              padEnds: isPadEnds,
              physics: const BouncingScrollPhysics(),
              controller: widget.pageController,
              itemCount: cardCount,
              itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: _buildTransformedPageItem(
                        index, context, _height, _buildCardItem()),
                  )),
        ),
        const SizedBox(
          height: 22,
        ),
        SmoothPageIndicator(
            controller: widget.pageController, // PageController
            count: cardCount,
            effect: const ScaleEffect(
                activeDotColor: Colors.white,
                scale: 7 / 4,
                dotWidth: 4,
                dotHeight: 4), // your preferred effect
            onDotClicked: (index) {
              widget.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500), curve: Curves.ease);
            }),
      ],
    );
  }

  Widget _buildCardItem() {
    return FrostedGlassEffect(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const CustomText(
              'Current Balance',
              color: Colors.white60,
              fontSize: 14,
            ),
            const CustomText(
              "\$5 750,20",
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              "**** **** **** 1280",
              fontSize: 15,
              letterSpacing: 4,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  "09/25",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                Image.asset("assets/mastercard_logo.png")
              ],
            )
          ],
        ),
      ),
    );
  }
}
