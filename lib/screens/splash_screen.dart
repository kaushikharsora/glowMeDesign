import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:glowme/screens/sign-in/sign_in_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedSplashScreen(
          splash: 'assets/images/splash_screen.png',
          nextScreen: const SignInScreen(),
          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.bottomToTop,
        ),
      ),
    );
  }
}