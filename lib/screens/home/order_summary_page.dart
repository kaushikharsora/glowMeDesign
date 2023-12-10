import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glowme/screens/home/services_widget.dart';

class OrderSummaryScreen extends StatelessWidget {
  @override
  final List<ServiceListView> _serviceListView = [
    ServiceListView(
        image: 'assets/images/hair_icon.svg',
        title: 'Hair',
        color: const Color(0xffB41854)),
    ServiceListView(
        image: 'assets/images/makeup_icon.svg',
        title: 'Makeup',
        color: const Color(0xffEC8D8D)),
    ServiceListView(
        image: 'assets/images/henna_icon.svg',
        title: 'Henna',
        color: const Color(0xffB41854)),
    ServiceListView(
        image: 'assets/images/manicur_icon.svg',
        title: 'Nail art',
        color: const Color(0xffEC8D8D))
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xffB41854),
        centerTitle: true,
        title: const Text(
          'Order Summary',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 0.0),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
  elevation: 5.0,
  margin: const EdgeInsets.all(10.0),
  child: Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Air Makeup',
              style: TextStyle(
                color: Color(0xFF373738),
                fontSize: 16,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Vendor: Reema Deshmukh',
              style: TextStyle(
                color: Color(0xFF706D6D),
                fontSize: 13,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '₹199',
              style: TextStyle(
                color: Color(0xFFB41854),
                fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 160,
              height: 24,
              decoration: ShapeDecoration(
                color: const Color(0xFFEB8C8C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Center(
                child: Text(
                  '8 Oct 2023, 10:00-12:00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 8.0,
        right: 8.0,
        child: IconButton(
          icon: const Icon(Icons.close, color: Color(0xffB41854),),
          onPressed: () {
           _showPopup(context);
          },
        ),
      ),
    ],
  ),
),

              const SizedBox(height: 10.0),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Add More',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 100,
                  height: 150,
                  child: Card(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: _serviceListView.map((service) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0), // Add spacing here
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width: 90, // Adjust the width as needed
                                    height: 80, // Adjust the height as needed
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: service.color,
                                    ),
                                    child: Center(
                                        child: SvgPicture.asset(service.image)),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Adjust the spacing between the circle and text
                                  Text(
                                    service.title,
                                    style: const TextStyle(
                                      color: Color(0xFF383838),
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )),

              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  'Coupons',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              // Add more features here
              SizedBox(
                height: 60,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Row(
                          children: [
                            Image.asset('assets/images/coupon.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Apply Coupons',
                              style: TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 13,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 18.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Color(0xffB41854),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  'Price Details (1 item)',
                  style: TextStyle(
                    color: Color(0xFF383838),
                    fontSize: 13,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 130,
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, top: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total MRP',
                              style: TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              '₹199',
                              style: TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, top: 14, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Coupon Discount',
                              style: TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              'Apply Coupon',
                              style: TextStyle(
                                color: Color(0xFFB41854),
                                fontSize: 13,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Color(0x4CD9D9D9),
                        thickness: 3,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, top: 14, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 13,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            Text(
                              '₹199',
                              style: TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 13,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        color: const Color(0xFFB41854), // Customize the color as needed
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: const Icon(Icons.location_on, size: 22,color: Color(0xFFB41854),),
                  ),
                  const Text(
          'Add Address',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
                ],
              ),
            
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: const Icon(Icons.arrow_forward_ios, size: 22,color: Color(0xFFB41854),),
                  ),
            ],
          
        ),
      ),
    );
  }
}


void _showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Remove Item?',
              style: TextStyle(
                color: Color(0xFF383838),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: const Icon(Icons.close, color: Color(0xffB41854),))
          ],
        ),
        content: Container(
          width: 400.0, // Set your desired width
          height: 100.0, // Set your desired height
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             
              const SizedBox(height: 10),
              const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Are you sure you want to remove ',
                style: TextStyle(
                  color: Color(0xFF706D6D),
                  fontSize: 13,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              TextSpan(
                text: 'Air Makeup',
                style: TextStyle(
                  color: Color(0xFFB41854),
                  fontSize: 13,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 
              ElevatedButton(
                onPressed: () {
                  // Handle the removal action
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: const Color(0xFFF9C5C5), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                  ),
                  minimumSize: const Size(130, 40), 
                ),
                child: const Text("Cancel"),
              ),
               ElevatedButton(
                onPressed: () {
                  // Handle the removal action
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: const Color(0xFFB41854), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                  ),
                  minimumSize: const Size(130, 40), 
                ),
                child: const Text("Confirm"),
              ),
                ],
              )
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
      );
    },
  );
}
