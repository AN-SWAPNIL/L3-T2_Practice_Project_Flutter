import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../welcome/welcomepage.dart';
//import 'package:demo_project/app/modules/home/views/home_view.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> planeAnimation;

  @override
  void onInit() {
    super.onInit();

    // Airplane animation setup
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    planeAnimation =
        Tween<Offset>(begin: Offset(-1.5, 0), end: Offset(1.5, 0)).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        skipSplash();
      }
    });

    // Navigate to home screen after 4 seconds
    // Future.delayed(Duration(seconds: 4), () {
    //   Get.off(() => HomeView(), transition: Transition.fadeIn);
    // });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void skipSplash() {
    Get.off(() => welcomepage(),
        transition: Transition.leftToRightWithFade,
        duration: Duration(milliseconds: 500));
  }
}
