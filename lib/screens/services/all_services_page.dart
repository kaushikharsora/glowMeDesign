import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/font_family_constants.dart';
import 'package:glowme/model/service_model.dart';
import 'package:glowme/provider/landing_screen_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  LandingScreenProvider? landingScreenProvider;
  @override
  void initState() {
    landingScreenProvider =
        Provider.of<LandingScreenProvider>(context, listen: false);
    landingScreenProvider?.fetchAllService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingScreenProvider>(
        builder: (context, landingScreenProvider, child) {
      Service? services = landingScreenProvider.fetchService;
      if (services != null) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Services',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamilyConstants.robotoRegular,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            leading: IconButton(
                onPressed: () {
                  context.go(home);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: Colors.white,
                )),
            backgroundColor: const Color(0xffB41854),
          ),
          body: Consumer<LandingScreenProvider>(
              builder: (context, landingScreenProvider, child) {
            return Container(
              height: 600,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ListView.separated(
                itemCount: services.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Uint8List image =
                  base64Decode(services.data[index].serviceImage!);
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Adjust padding as needed
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                      child: Image.memory(image, color: Colors.white, fit: BoxFit.cover,),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Color(0xffB41854)),
                    title: Text(
                      services.data[index].serviceName!,
                      style: const TextStyle(
                          fontSize: 18, color: Color(0xff383838)),
                    ),
                    onTap: () {
                      print('$index clicked');
                      context.go(filteredVendor);
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index < services.data.length - 1) {
                    return const Divider(
                      thickness: 2,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          }),
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
