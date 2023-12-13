import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/font_family_constants.dart';
import 'package:glowme/constants/image.dart';
import 'package:glowme/widgets/view_all_button.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentCalendar extends StatefulWidget {
  const AppointmentCalendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  __AppointmentCalendarState createState() => __AppointmentCalendarState();
}

class __AppointmentCalendarState extends State<AppointmentCalendar> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTimeSlot = '9:00 AM';
  List<String> items = [
    "Kaushik",
    "Developer",
    "Tester",
    "User",
    "Artist",
  ];

  List<String> filters = [
    "All",
    "HD MakeUp",
    "Hair",
    "Nail",
    "Air Brushes",
    "Matte Makeup"
  ];

  List<String> filteredItems = [];

  String selectedFilter = "All"; // Default filter
  bool isFavorite = false;
  Map<String, bool> favorites = {};
  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items); // Initialize filteredItems with all items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Book Appointment'),
        centerTitle: true,
        backgroundColor: const Color(0xffB41854),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all( 10),
              child: Text(
                'Upcoming Appointments',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff383838),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    fontFamily: FontFamilyConstants.robotoRegular),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.separated(
                itemCount: filteredItems.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return InkWell(
                    onTap: () {
                      context.go(vendorProfile);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset.zero,
                                color: const Color(0xff383838).withOpacity(0.08),
                                blurRadius: 12),
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(ImageConstants.imageUser01,
                                  height: 46, width: 46),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Air Makeup'),
                                    Text(
                                      'Order ID: 9293933',
                                      style: TextStyle(color: Color(0xffB41854)),
                                    ),
                                    Text(
                                      'Date: 23 oct 2023',
                                      style: TextStyle(color: Color(0xffB41854)),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                '₹199',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily:
                                        FontFamilyConstants.robotoRegular),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xffB41854),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: const Text(
                                'Cancel Appointment',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontFamilyConstants.latoRegular,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
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
            const Padding(
              padding: EdgeInsets.all( 10),
              child: Text(
                'Past Appointments',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff383838),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    fontFamily: FontFamilyConstants.robotoRegular),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.separated(
                itemCount: filteredItems.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return InkWell(
                    onTap: () {
                      context.go(vendorProfile);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset.zero,
                                color: const Color(0xff383838).withOpacity(0.08),
                                blurRadius: 12),
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(ImageConstants.imageUser01,
                                  height: 46, width: 46),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Air Makeup'),
                                    Text(
                                      'Order ID: 9293933',
                                      style: TextStyle(color: Color(0xffB41854)),
                                    ),
                                    Text(
                                      'Date: 23 oct 2023',
                                      style: TextStyle(color: Color(0xffB41854)),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                '₹199',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily:
                                        FontFamilyConstants.robotoRegular),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xffB41854),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: const Text(
                                ' View Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontFamilyConstants.latoRegular,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
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
          ],
        ),
      ),
    );
  }
}

class TimePickerBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final String selectedTimeSlot;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<String> onTimeSlotSelected;

  const TimePickerBottomSheet({
    super.key,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.onDateSelected,
    required this.onTimeSlotSelected,
  });

  @override
  State<TimePickerBottomSheet> createState() => _TimePickerBottomSheetState();
}

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  List<String> timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
    '7:00 PM',
    '8:00 PM',
  ];

  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _confirmedTimeSlot;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Date',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TableCalendar(
                calendarFormat: _calendarFormat,
                focusedDay: _focusedDay,
                firstDay: DateTime(2023, 1, 1),
                lastDay: DateTime(2023, 12, 31),
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update focusedDay to match selectedDay
                  });
                },
                selectedDayPredicate: (day) {
                  return isSameDay(day, _selectedDay ?? widget.selectedDate);
                },
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Color(0xffB41854), // Change the month text color
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  formatButtonVisible: false,
                ),
                calendarStyle: const CalendarStyle(
                  // Customize day colors here
                  defaultTextStyle: TextStyle(
                    color: Colors.black,
                  ),

                  selectedTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  todayTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  selectedDecoration: BoxDecoration(
                    color:
                        Color(0xffB41854), // Change selected day circle color
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color:
                        Color(0xffFBBEBE), // Change selected day circle color
                    shape: BoxShape.circle,
                  ),
                  // markersColor: Colors.red, // Customize the color for markers
                  outsideDaysVisible: false,
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  // Customize the style for each day of the week
                  weekdayStyle: TextStyle(
                    color:
                        Color(0xffB41854), // Customize the color for weekdays
                  ),
                  weekendStyle: TextStyle(
                    color:
                        Color(0xffB41854), // Customize the color for weekends
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Select Time',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Adjust the cross-axis count as needed
                  crossAxisSpacing: 8.0, // Adjust the spacing between columns
                  mainAxisSpacing: 8.0, // Adjust the spacing between rows
                ),
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return buildTimeSlot(timeSlots[index]);
                },
              ),
              const SizedBox(height: 16),
              ViewAllElevatedButton(
                  title: 'NEXT',
                  context: context,
                  onPressed: () {
                    context.go(filteredVendor);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimeSlot(String timeSlot) {
    bool isSelected = timeSlot == _confirmedTimeSlot;

    return GestureDetector(
      onTap: () {
        setState(() {
          _confirmedTimeSlot = timeSlot;
        });
      },
      child: Container(
        width: 50, // Adjust the width as needed
        height: 30, // Adjust the height as needed
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffB41854) : Colors.grey[300],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            timeSlot,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedTopSheet extends StatelessWidget {
  final Widget child;

  const RoundedTopSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: child,
    );
  }
}
