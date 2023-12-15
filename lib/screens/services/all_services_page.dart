import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/font_family_constants.dart';
import 'package:glowme/constants/image.dart';
import 'package:glowme/provider/landing_screen_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  final List<ServiceListView> _serviceListView = [
    ServiceListView(
        image: ImageConstants.icService01,
        title: 'Hair',
        color: const Color(0xffB41854)),
    ServiceListView(
        image: ImageConstants.icService02,
        title: 'Makeup',
        color: const Color(0xffEC8D8D)),
    ServiceListView(
        image: ImageConstants.icService01,
        title: 'Henna',
        color: const Color(0xffB41854)),
    ServiceListView(
        image: ImageConstants.icService02,
        title: 'Nail art',
        color: const Color(0xffEC8D8D)),
  ];
  @override
  void initState() {
    //Provider.of<LandingScreenProvider>(context, listen: false).fetchAllService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            itemCount: _serviceListView.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Adjust padding as needed
                leading: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(_serviceListView[index].image),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xffB41854)),
                title: Text(
                  _serviceListView[index].title,
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xff383838)),
                ),
                onTap: () {
                  print('$index clicked');
                  context.go(filteredVendor);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index < _serviceListView.length - 1) {
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
  }
}

class ServiceListView {
  final String image;
  final String title;
  final Color color;

  ServiceListView(
      {required this.image, required this.title, required this.color});
}
