import 'dart:convert';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:glowme/provider/landing_screen_provider.dart';
import 'package:provider/provider.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerState();
}

class _BannerState extends State<BannerWidget> {
  int _currentIndex = 0;

  void _updateCurrentIndex(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch banners when the widget is initialized
    Provider.of<LandingScreenProvider>(context, listen: false).fetchAllBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingScreenProvider>(
      builder: (context, landingScreenProvider, child) {
        //Check if data is available
        if (landingScreenProvider.fetchBanner != null &&
            landingScreenProvider.fetchBanner!.success) {
        //Map the banner data to BannerCardWidget
        List<Widget> banners = landingScreenProvider.fetchBanner!.data.map((bannerData) {
          return BannerCardWidget(
            imageUrl: bannerData.image,
            title: bannerData.title,
            description: bannerData.description,
          );
        }).toList();
        return Column(
          children: [
            CarouselSlider(
              items: banners,
              options: CarouselOptions(
                autoPlay: true,
                onPageChanged: _updateCurrentIndex,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
              ),
            ),
            CarouselIndicator(
              height: 10.0,
              width: 20.0,
              count: banners.length,
              index: _currentIndex,
              cornerRadius: 20,
              activeColor: const Color(0xffB41854),
              color: Colors.grey,
              space: 5.0,
            ),
          ],
        );
        } else {
          // Handle loading or error state
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class BannerCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  BannerCardWidget({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64.decode(imageUrl);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        child: Stack(
          children: [
            Image.memory(
              bytes,
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
