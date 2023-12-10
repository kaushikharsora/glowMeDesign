import 'dart:math';
import 'package:flutter/material.dart';
import 'package:glowme/model/user_model.dart';
import 'package:glowme/service/login/user_login.dart';

class UserDetailsProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  List<User> _userDetails = [];
  String _generatedOtp='';
  bool _userExist= false;
  bool _userSignedIn= false;


  // ------------- Getters--------------
  List<User> get userDetails => _userDetails;
  String get generatedOtp => _generatedOtp;
  bool get userExist=> _userExist;
  bool get userSignedIn=> _userSignedIn;

  // ------------ Setters----------------------

void setOtp(value){
  print('otp :: $value');
  _generatedOtp = value;
  notifyListeners();

}
  void setListOfUsers(List<User> value) {
    _userDetails = value;
    notifyListeners();
  }
void setUserExist(value){
  _userExist = value;
  notifyListeners();
}
void setUserSignIn(value){
  _userSignedIn = value;
  notifyListeners();
}

// ------------ Functions----------------
  // Generate a random 6-digit OTP
   generateRandomOtp() {
    _generatedOtp =  (Random().nextInt(900000) + 100000).toString();
    setOtp(_generatedOtp);
  }

  // Fetch all users
 void fetchAllUsers() async {
  final userDetails = await UserApi.fetchAllUsers();
  List<User>? users = userDetails.users;
  setListOfUsers(users!);
}


  // Check if the user exists in the list
  bool doesUserExist(String userNumber) {
    final List<User> userNumbers = _userDetails;
    return userNumbers.any((user) => user.phoneNumber == userNumber);
  }

  // Sign in user function
  void signInUser() {
    // Implement your sign-in logic here
    // You can access the user's phone number using phoneNumberController.text
    // and OTP using otpController.text
    String userPhoneNumber = phoneNumberController.text;
    String userEnteredOtp = otpController.text;

    // Generate a random OTP for comparison
    
     print('otp generated ::::: $_generatedOtp');
    if (userEnteredOtp == _generatedOtp) {
      print('matcged');
      if (doesUserExist(userPhoneNumber)) {
        
        setUserExist(true);
        UserApi.signInUser(phoneNumberController.text).then((value){
          setUserSignIn(true);
        });
        
      } else {
        
        // User does not exist, perform create logic
        UserApi.createUser(phoneNumberController.text).then((value){
         
          setUserSignIn(true);
        });

      }
    } else {
      // Invalid OTP, handle accordingly (e.g., show an error message)
      print('Invalid OTP. Sign-in or user creation aborted.');
    }
  }
}