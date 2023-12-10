import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> favorites = [];
  List<String> itemList = [];
  Map<String, bool> itemStates = {};
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];
  bool isFavorite = false;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  height: 120,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile picture
                      const CircleAvatar(
                        // backgroundImage: AssetImage('assets/profile_picture.jpg'),
                        radius: 40.0,
                      ),
                      const SizedBox(width: 16.0),
                      // Name
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your Name',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            // Favourites button
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.red[100],
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Expansion Tile - About Me
              Card(
                child: ExpansionTile(
                  title: Text(
                    'About Me',
                    style: TextStyle(
                        color: isExpanded
                            ? const Color(0xffB41854)
                            : const Color(0xff383838),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    isExpanded
                        ? Icons.arrow_drop_up_sharp
                        : Icons.arrow_drop_down,
                    color: isExpanded
                        ? const Color(0xffB41854)
                        : const Color(0xff383838),
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpanded = value;
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Text(
                        "I'm Reema, your makeup magician on a mission to unveil the beauty that resides within each face I touch. With brushes as my wands and palettes as my spellbooks, I embark on a journey to enhance your unique allure.Makeup, to me, is more than just colors on a canvas—it's a celebration of individuality. I believe that every face tells a story, and my artistry is dedicated to bringing out the chapters that make you uniquely you.",
                        style: TextStyle(
                            color: Color.fromRGBO(112, 109, 109, 0.87),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16.0),
              // ListView with ListTile
              const SizedBox(height: 16.0),
              // ListView with ListTile
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Items',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff383838),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(items[index]),
                                const Text('Rs 122'),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                String currentItem = items[index];

                                setState(() {
                                  if (itemList.contains(currentItem)) {
                                    itemList.remove(currentItem);
                                  } else {
                                    itemList.add(currentItem);
                                  }
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 3),
                                    backgroundColor: const Color(0xffB41854),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Item ${itemList.length} added!'),
                                        GestureDetector(
                                          onTap: (){
                                            context.go(orderSummary);
                                          },
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward,
                                              color: Color(0xffB41854),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 100,
                                padding: const EdgeInsets.all(12),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: itemList.contains(items[index])
                                      ? const Color(0xffFBBEBE)
                                      : const Color(0xffB41854),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    itemList.contains(items[index])
                                        ? 'Remove'
                                        : 'Add',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
            ]),
      ),
    );
  }
}
