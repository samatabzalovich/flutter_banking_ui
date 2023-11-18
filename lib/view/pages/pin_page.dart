import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/utils/get_pain.dart';
import 'package:flutter_banking_ui/view/widgets/custom_scaffold.dart';
import 'package:flutter_banking_ui/view/widgets/custom_text.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomPaint(
        painter: StatiSmallBallsPainter(),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 55),
                    alignment: Alignment.center,
                    child: CustomPaint(
                      size: const Size(200, 200),
                      painter: StaticBallPainter(const Offset(60, 40), 69),
                      child: const CustomText("BankApp",
                          fontSize: 50, color: Colors.white),
                    ))),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  const CustomText(
                    "Sign in by",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _signInButtonBuilder("assets/faceID.png", 'Face ID', () {}),
                      _signInButtonBuilder("assets/pin.png", 'PIN', () {}),
                      _signInButtonBuilder("assets/arrow.png", 'Other', () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInButtonBuilder(String imgPath, String type, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgPath),
          CustomText(type),
        ],
      ),
    );
  }
}

class StaticBallPainter extends CustomPainter {
  final Offset offset;
  final double radius;
  StaticBallPainter( this.offset, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    

    canvas.drawCircle(
      offset,
      radius,
      getPaintForCircle(offset, radius),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class StatiSmallBallsPainter extends CustomPainter {
  StatiSmallBallsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width+10, size.height * 0.15),
      28,
      getPaintForCircle(Offset(size.width+10, size.height * 0.15), 28),
    );
    canvas.drawCircle(
      Offset(size.width, size.height * 0.43),
      28,
      getPaintForCircle(Offset(size.width, size.height * 0.43), 28),
    );
  }

  

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
