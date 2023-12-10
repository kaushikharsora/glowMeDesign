import 'package:flutter/material.dart';
import 'package:glowme/screens/home/banner_widget.dart';
import 'package:glowme/screens/home/home_page.dart';
import 'package:glowme/screens/home/recommendation_widget.dart';
import 'package:glowme/screens/home/services_widget.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: MyAppBar(),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerWidget(),
                SizedBox(height: 30),
                ServicePage(),
                SizedBox(height: 20),
                RecommendationWidget(),
                // ViewAllElevatedButton(title: 'View All', onPressed: () {}, context: context),
                // const SizedBox(height: 20),
                // LikedByYouWidget(),
                // ViewAllElevatedButton(title: 'View All', onPressed: () {}, context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
