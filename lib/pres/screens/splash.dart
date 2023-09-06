import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/images.dart';
import 'onboarding.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: AnimatedSplashScreen(
            splash: Lottie.asset(splashIm,
                fit: BoxFit.cover, width: 300, height: 300),
            backgroundColor: Colors.blueGrey,
            nextScreen: Onboarding()));
  }
}
