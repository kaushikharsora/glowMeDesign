import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
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
          const Expanded(
            child: Center(
              child: Text(
                'Your main content goes here.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => RoundedTopSheet(
                  child: TimePickerBottomSheet(
                    selectedDate: _selectedDate,
                    selectedTimeSlot: _selectedTimeSlot,
                    onDateSelected: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    onTimeSlotSelected: (timeSlot) {
                      setState(() {
                        _selectedTimeSlot = timeSlot;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TimePickerBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final String selectedTimeSlot;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<String> onTimeSlotSelected;

  const TimePickerBottomSheet({super.key, 
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
                    color: Color(0xffB41854), // Change selected day circle color
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xffFBBEBE), // Change selected day circle color
                    shape: BoxShape.circle,
                  ),
                  // markersColor: Colors.red, // Customize the color for markers
                  outsideDaysVisible: false,
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  // Customize the style for each day of the week
                  weekdayStyle: TextStyle(
                    color: Color(0xffB41854), // Customize the color for weekdays
                  ),
                  weekendStyle: TextStyle(
                    color: Color(0xffB41854), // Customize the color for weekends
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
                  title: 'NEXT', context: context, onPressed: () {
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
