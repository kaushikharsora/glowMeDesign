import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/colors.dart';
import 'package:glowme/constants/font_family_constants.dart';
import 'package:glowme/constants/image.dart';
import 'package:glowme/constants/strings.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  int _currentPage = 0;
  String pageImage = ImageConstants.image_onBoarding01;

  void _autoRotateOff() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  void _autoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _autoScroll();
    _autoRotateOff();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white01,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 60, right: 30, bottom: 37),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  context.go(signIn);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: pink01,
                      fontFamily: FontFamilyConstants.latoRegular,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )),
            CupertinoButton(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
              borderRadius: BorderRadius.circular(27),
              color: pink02,
              disabledColor: pink01,
              child: Text(
                'Next',
                style: TextStyle(
                    color: white01,
                    fontFamily: FontFamilyConstants.latoRegular,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              onPressed: () {
                context.go(signIn);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 61),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPageView(),
            Container(
              padding: const EdgeInsets.only(
                  top: 29, left: 14, right: 14, bottom: 0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: pink01,
                shape: BoxShape.circle,
              ),
              child: Image.asset(pageImage, height: 199, width: 199),
            ),
            const SizedBox(height: 32),
            Text(
              AppStrings.welcpme_to_glow_me,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamilyConstants.robotoRegular,
                  color: gray01),
            ),
            const SizedBox(height: 12),
            Text(
              AppStrings.onBoarding_details_text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamilyConstants.robotoRegular,
                  color: gray02),
            ),
            const SizedBox(height: 40),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                radius: 48,
                dotColor: gray03,
                activeDotColor: pink01,
                dotHeight: 6,
                dotWidth: 6,
                expansionFactor: (2 > 1) ? 4 : 1.01,
                strokeWidth: 4,
                spacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      height: 0,
      child: PageView.builder(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        padEnds: false,
        itemCount: 3,
        onPageChanged: (value) {
          if (value == 0) {
            pageImage = ImageConstants.image_onBoarding01;
          } else if (value == 1) {
            pageImage = ImageConstants.image_onBoarding02;
          } else if (value == 2) {
            pageImage = ImageConstants.image_onBoarding03;
          } else {
            pageImage = ImageConstants.image_onBoarding01;
          }
          setState(() {});
        },
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
