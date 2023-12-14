import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Fast2SMSService extends ChangeNotifier{
  static const String apiKey = 'E8dKyq3cL2DPGr9zABkmhXviYnaxOFeM0IUu6ogR4QwH1bsWTVtVCQmqEuGLB27idWbFPejHfv8NDoOK';
  // bool _sendSMSLoading = false;
  // bool get getSendSMSLoading => _sendSMSLoading;
  // static void setSendSMSLoading(value){
  //   _sendSMSLoading = value;
  //   notifyListeners();
  // }

    static sendSMS(String message, String phone) async {
    // setSendSMSLoading(true);
    const url = 'https://www.fast2sms.com/dev/bulkV2';

    final headers = {
      'authorization': apiKey,
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'message': message,
      'language': 'english',
      'route': 'q',
      'numbers': phone,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('SMS sent successfully');
        Fluttertoast.showToast(msg: "OTP sent successfully");
      } else {
        print('Failed to send SMS. Error: ${response.body}');
      }
    } catch (error) {
      print('Error sending SMS: $error');
    }
    // setSendSMSLoading(false);
  }
}