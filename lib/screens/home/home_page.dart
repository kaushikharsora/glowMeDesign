import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/provider/landing_screen_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: const PreferredSize(
        //   preferredSize: Size.fromHeight(150.0),
        //   child: MyAppBar(),
        // ),
        body: widget.child,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: const Color(0xffFFFFFF),
                selectedItemColor: const Color(0xffB41854),
                unselectedItemColor: const Color.fromRGBO(112, 109, 109, 0.88),
                selectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffB41854),
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 8,
                    color: Color.fromRGBO(112, 109, 109, 0.88),
                    fontWeight: FontWeight.w600),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: 'Appointment',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.wallet),
                    label: 'Wallet',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: (index) {
                  _selectedIndex = index;
                  final landingScreenProvider = Provider.of<LandingScreenProvider>(context, listen: false);
                  landingScreenProvider.setBottomNavIndex(index);
                  if(landingScreenProvider.bottomNavIndex ==0){
                    context.go(home);
                  }else if(landingScreenProvider.bottomNavIndex == 1){
                    context.go(appointmentCalendar);
                  }else if(landingScreenProvider.bottomNavIndex == 2){
                    context.go(walletPage);
                  }else if(landingScreenProvider.bottomNavIndex == 3){
                    context.go(profilePage);
                  }
                  setState(() {});
                },
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      child: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: const Color(0xffB41854),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: <Widget>[
                    const SizedBox(width: 15),
                    const Icon(Icons.location_on, color: Colors.white, size: 30,),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      width: 100.0,
                      height: 30.0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Nagpur",
                              style: GoogleFonts.roboto(
                                color: const Color(0xff383838),
                                fontSize: 17.0,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Image.asset('assets/images/notification_bell.png'),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                  height: 40,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(
                        Icons.search_sharp,
                        color: Color(0xffB41854),
                        size: 30,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffffffff)),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintStyle: const TextStyle(
                          color: Color(0xff706D6D),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      hintText: 'Search Here',
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
