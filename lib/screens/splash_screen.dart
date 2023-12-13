import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/constants.dart';
import 'package:glowme/screens/home/home_page_layout.dart';
import 'package:glowme/screens/sign-in/onboarding_page.dart';
import 'package:glowme/service/preference_service/preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool moveToHome = false;

  @override
  void initState() {
    _checkUserValue();
    super.initState();
  }

  void _checkUserValue() async {
    final userVal = await SharedPreference.getData(IS_AUTH);
    if(userVal == 'true'){
      moveToHome = true;
      context.go(home);
    }else{
      moveToHome = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(moveToHome){
      return Scaffold(body: Container(color: Colors.white,),);
    }else{
      return MaterialApp(
        home: Scaffold(
          body: AnimatedSplashScreen(
            splash: 'assets/images/splash_screen.png',
            nextScreen: const OnBoardingPage(),
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
            duration: 1500,
          ),
        ),
      );
    }

  }
}