import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:glowme/model/vendor_model.dart';
import 'package:glowme/provider/landing_screen_provider.dart';
import 'package:provider/provider.dart';

class RecommendationWidget extends StatefulWidget {
  const RecommendationWidget({
    super.key
  });

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
  final List<ServiceListView> _serviceListView = [
    ServiceListView(
        image: 'assets/images/hair_icon.svg', title: 'Hair', rating: 4.5),
    ServiceListView(
        image: 'assets/images/makeup_icon.svg', title: 'Makeup', rating: 4.2),
    ServiceListView(
        image: 'assets/images/henna_icon.svg', title: 'Henna', rating: 4.8),
    ServiceListView(
        image: 'assets/images/manicur_icon.svg',
        title: 'Nail art',
        rating: 4.0),
  ];
  @override
  void initState() {
    Provider.of<LandingScreenProvider>(context, listen: false)
        .fetchAllVendors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingScreenProvider>(
        builder: (context, landingScreenProvider, child) {
      Vendor? vendorList = landingScreenProvider.vendorService;

      return vendorList != null
          ? Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Recommendation',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff706D6D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Our recommendation for best services',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff706D6D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Display two items per row
                    mainAxisSpacing: 1.0, // Add vertical spacing between items
                    crossAxisSpacing:
                        18.0, // Add horizontal spacing between items
                    childAspectRatio: 0.8, // Adjust the aspect ratio as needed
                  ),
                  itemCount: vendorList.data.length,
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scrolling
                  itemBuilder: (BuildContext context, int index) {
                    return ServiceListItem(
                      image: vendorList.data[index].vendorImage!,
                      title: vendorList.data[index].name,
                      rating: vendorList.data[index].rating,
                    );
                  },
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator());
    });
  }
}

class ServiceListView {
  final String image;
  final String title;
  double? rating;
  Color? color;

  ServiceListView(
      {required this.image, required this.title, this.rating, this.color});
}

class ServiceListItem extends StatelessWidget {
  final String image;
  final String title;
  final double rating;

  const ServiceListItem({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64.decode(image);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  Positioned(
                    child: Image.memory(bytes),
                    width: 100,
                    height: 100,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffB41854),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Rating: ${rating}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}