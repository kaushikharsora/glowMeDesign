import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:go_router/go_router.dart';

class FilteredVendors extends StatefulWidget {
  const FilteredVendors({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilteredVendorsState createState() => _FilteredVendorsState();
}

class _FilteredVendorsState extends State<FilteredVendors> {
  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];

  List<String> filters = ["All", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];

  List<String> filteredItems = [];

  String selectedFilter = "All"; // Default filter
bool isFavorite = false;
Map<String, bool> favorites = {};
  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items); // Initialize filteredItems with all items
  }

  void filterList(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == "All") {
        filteredItems = List.from(items);
      } else {
        filteredItems = items.where((item) => item.contains(filter)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Book Appointment'),
        centerTitle: true,
        backgroundColor: const Color(0xffB41854),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20.0, right: 20, top: 20),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black12,
                //     offset: Offset(1, 1),
                //     blurRadius: 0.1,
                  
                //   ),
                // ],
              ),
              child: TextField(
                onChanged: (value) {
                  // Implement search functionality
                  setState(() {
                    filteredItems = items
                        .where((item) => item.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  
                  labelText: 'Search',
                  labelStyle: const TextStyle(color: Colors.transparent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Color(0xffB41854)),
                  ),
                  suffixIcon: const Icon(Icons.search_sharp, color: Color(0xffB41854), size: 29,),
                  filled: true,
                  fillColor: Colors.white, // Background color
                  contentPadding: const EdgeInsets.all(16.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      filterList(filters[index]);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedFilter == filters[index] ? const Color(0xffB41854) :  Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(filters[index],style: TextStyle(color:selectedFilter == filters[index] ?  Colors.white :  Colors.black, )),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 40,),
          Expanded(
            
            child: ListView.separated(
              itemCount: filteredItems.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                final isFavorite = favorites[item] ?? false;
                return Padding(
                  padding: const EdgeInsets.only(left:10.0, right: 10, top: 10),
                  child: Card(
                    elevation: 5.0,
                    child: ListTile(
                      onTap: (){
                        context.go(vendorProfile);
                      },
                      leading: CircleAvatar(
                        // Replace with your profile picture logic
                        child: Text(item[0]),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item),
                          const SizedBox(height: 10,),
                          const Text('Ratings: 4.5'), // Replace with actual ratings
                          const SizedBox(height: 10,),
                          const Text('Ratings: 4.5'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.red[100],
                        ),
                        onPressed: () {
                          setState(() {
                            favorites[item] = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
          )),
        ],
      ),
    );

  }
}