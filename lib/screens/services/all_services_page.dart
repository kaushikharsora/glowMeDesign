import 'package:flutter/material.dart';
import 'package:glowme/provider/landing_screen_provider.dart';
import 'package:provider/provider.dart';

class AllServices extends StatefulWidget {

   AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
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
        title: const Text('Services'),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xffB41854),
      ),
      body: Consumer<LandingScreenProvider>(
       
        builder: (context, landingScreenProvider, child) {
          return Container(
        height: 600,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: landingScreenProvider.fetchService!.data.length,
          itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
            leading: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:Colors.pink,
              ),
              child: Center(
                child: Image.asset(landingScreenProvider.fetchService!.data[index].serviceImage!),
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xffB41854)),
            title:  Text(landingScreenProvider.fetchService!.data[index].serviceName!, style: const TextStyle(fontSize: 18, color: Color(0xff383838)),),
            onTap: (){
              print('$index clicked');
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
        }
      )

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
