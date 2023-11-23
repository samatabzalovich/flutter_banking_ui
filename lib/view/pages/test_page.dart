import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/view/widgets/custom_text.dart';
import 'package:flutter_banking_ui/view/widgets/frosted_glass_container.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TestPage extends StatelessWidget {
    TestPage({super.key});
  final PageController controller = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        
        height: MediaQuery.of(context).size.height / 4,
        child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: controller,
          itemCount: 2,
           itemBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: _buildCardItem(),
                )
        ),
      ),
    );
  }

  FrostedGlassEffect _buildCardItem() {
    return FrostedGlassEffect(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Current Balance',
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                    CustomText(
                      "\$5 750,20",
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      "**** **** **** 1280",
                      fontSize: 15,
                      letterSpacing: 4,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          "09/25",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        Image.asset("assets/mastercard_logo.png")
                      ],
                    )
                  ],
                ),
              );
  }
}
