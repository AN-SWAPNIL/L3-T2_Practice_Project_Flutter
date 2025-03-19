import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:cw/app/modules/splash/controllers/splash_controller.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,

      body: GestureDetector(
        onTap: controller.skipSplash, // Tap to skip
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animations/travel.json',
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(height: 20),

                  // Animated Bouncing Text
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        "Explore Bangladesh With Us!",
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff16232),
                        ),
                        speed: Duration(milliseconds: 200),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Positioned(
                  left: 0,
                  right: 0, // Needed to center horizontally
                  top: 100, // Center vertically
                  child: Transform.translate(
                    offset: Offset(
                      controller.planeAnimation.value.dx *
                          MediaQuery.of(context).size.width /
                          2,
                      0,
                    ),
                    child: Lottie.asset(
                      'assets/animations/plane.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
