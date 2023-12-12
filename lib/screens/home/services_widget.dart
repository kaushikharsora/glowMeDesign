import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/colors.dart';
import 'package:glowme/constants/image.dart';
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
    //Provider.of<LandingScreenProvider>(context, listen: false).fetchAllService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingScreenProvider>(
        builder: (context, landingScreenProvider, child) {
      
      //Service? services = landingScreenProvider.fetchService;
      Service? services = Service(success: true, data: [
        ServiceData(id: 'service01', categoryId: 'c01', serviceImage: ImageConstants.icService02, serviceName: "hair", v: 1),
        ServiceData(id: 'service02', categoryId: 'c02', serviceImage: ImageConstants.icService01, serviceName: "makeup", v: 1),
        ServiceData(id: 'service01', categoryId: 'c01', serviceImage: ImageConstants.icService02, serviceName: "hair", v: 1),
        ServiceData(id: 'service02', categoryId: 'c02', serviceImage: ImageConstants.icService01, serviceName: "makeup", v: 1),
        ServiceData(id: 'service01', categoryId: 'c01', serviceImage: ImageConstants.icService02, serviceName: "hair", v: 1),
        ServiceData(id: 'service02', categoryId: 'c02', serviceImage: ImageConstants.icService01, serviceName: "makeup", v: 1),
        ServiceData(id: 'service01', categoryId: 'c01', serviceImage: ImageConstants.icService02, serviceName: "hair", v: 1),
        ServiceData(id: 'service02', categoryId: 'c02', serviceImage: ImageConstants.icService01, serviceName: "makeup", v: 1),
        ServiceData(id: 'service01', categoryId: 'c01', serviceImage: ImageConstants.icService02, serviceName: "hair", v: 1),
        ServiceData(id: 'service02', categoryId: 'c02', serviceImage: ImageConstants.icService01, serviceName: "makeup", v: 1),
      ]);

      if(services != null && services.data != null){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Services',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff706D6D),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '         Select a service',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff706D6D),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
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
                ),
              ],
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add spacing here
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
                        child: Image.asset(
                          services.data[index].serviceImage!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                          height:
                          8), // Adjust the spacing between the circle and text
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
              },),

            ),
            // SizedBox(
            //     height: 150,
            //     child: SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Row(
            //         children: services.data.map((service) {
            //           //Uint8List bytes = base64.decode(service.serviceImage!);
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add spacing here
            //             child: Column(
            //               children: [
            //                 Container(
            //                   padding: const EdgeInsets.all(10),
            //                   margin: const EdgeInsets.only(top: 20),
            //                   width: 80, // Adjust the width as needed
            //                   height: 80, // Adjust the height as needed
            //                   decoration: BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     color: services.data[index] ? pink01
            //                     // color: service.color,
            //                   ),
            //                   child: Image.asset(
            //                     service.serviceImage!,
            //                     width: 80,
            //                     height: 80,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                     height:
            //                     8), // Adjust the spacing between the circle and text
            //                 Text(
            //                   service.serviceName!,
            //                   style: const TextStyle(
            //                     fontSize: 14,
            //                     color: Color(0xff706D6D),
            //                     fontWeight: FontWeight.w300,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           );
            //         }).toList(),
            //       ),
            //     ))
          ],
        );
      }else{
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