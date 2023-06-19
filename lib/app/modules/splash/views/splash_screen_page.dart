import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashScreenPage extends GetView<SplashController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/video.png",
          height: 200,
          width: 200,
        )
      ],
    );
  }
}
