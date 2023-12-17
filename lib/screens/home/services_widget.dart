import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/colors.dart';
import 'package:glowme/model/service_model.dart';
import 'package:glowme/provider/landing_screen_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  void initState() {
    Provider.of<LandingScreenProvider>(context, listen: false)
        .fetchAllService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingScreenProvider>(
        builder: (context, landingScreenProvider, child) {
      Service? services = landingScreenProvider.fetchService;

      if (services != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Services',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff706D6D),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Select a service',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff706D6D),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          context.go(allservices);
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffB41854),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xffB41854),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: services.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  print(services.data[index].serviceImage);
                  Uint8List image =
                      base64Decode(services.data[index].serviceImage!);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Add spacing here
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 20),
                          width: 80, // Adjust the width as needed
                          height: 80, // Adjust the height as needed
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index.isEven ? pink01 : pink02
                              // color: service.color,
                              ),
                          child: Image.memory(
                            image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8), // Adjust the spacing between the circle and text
                        Text(
                          services.data[index].serviceName!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff706D6D),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

class ServiceListView {
  final String image;
  final String title;
  final Color color;

  ServiceListView(
      {required this.image, required this.title, required this.color});
}
