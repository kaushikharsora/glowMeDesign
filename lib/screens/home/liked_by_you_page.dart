import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikedByYouWidget extends StatelessWidget {
  LikedByYouWidget({super.key,});

  final List<ServiceListView> _serviceListView = [
    ServiceListView(image: 'assets/images/hair_icon.svg', title: 'Hair', rating: 4.5),
    ServiceListView(image: 'assets/images/makeup_icon.svg', title: 'Makeup', rating: 4.2),
    ServiceListView(image: 'assets/images/henna_icon.svg', title: 'Henna', rating: 4.8),
    ServiceListView(image: 'assets/images/manicur_icon.svg', title: 'Nail art', rating: 4.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  'Liked By You',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff706D6D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Services booked by you previously',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff706D6D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
    SizedBox(
  height: 220, // Set a fixed height, adjust as needed
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    // physics: const NeverScrollableScrollPhysics(), // Disable scrolling
    itemCount: _serviceListView.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ServiceListItem(
          image: _serviceListView[index].image,
          title: _serviceListView[index].title,
          rating: _serviceListView[index].rating,
        ),
      );
    },
  ),
),

      ],
    );
  }
}

class ServiceListView {
  final String image;
  final String title;
  final double rating;

  ServiceListView({required this.image, required this.title, required this.rating});
}

class ServiceListItem extends StatelessWidget {
  final String image;
  final String title;
  final double rating;

  const ServiceListItem({super.key, 
    required this.image,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.amber,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150, // Adjust the width of each item as needed
                    height: 150, // Adjust the height of each item as needed
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  SvgPicture.asset(
                    image,
                    width: 100, // Adjust the image size as needed
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          'Rating: $rating',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )]);
  }
}