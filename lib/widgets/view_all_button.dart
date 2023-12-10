import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ViewAllElevatedButton({
  required String title,
  required VoidCallback onPressed,
  required BuildContext context
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50)
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ), backgroundColor: const Color(0xffB41854), // Set button color to orange
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    ),
  );
}