// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/constants.dart';
import 'package:glowme/constants/font_family_constants.dart';
import 'package:glowme/provider/user_provider.dart';
import 'package:glowme/service/all%20services/fast_to_sms_service.dart';
import 'package:glowme/service/preference_service/preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreensState();
}

class _SignInScreensState extends State<SignInScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _phoneNumberErrorText;
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool sendOTP = false;
  bool isLoading = false;
  final focusedBorderColor = const Color(0xffD9D9D9);
  final fillColor = const Color.fromRGBO(243, 246, 249, 0);
  final borderColor = const Color(0xffD9D9D9);

  void _validatePhoneNumber(String value) {

    if(value.isNotEmpty && value.length == 10){
      userScreenProvider?.generateRandomOtp();
    }

    if (value.isEmpty || value.length != 10) {
      setState(() {
        _phoneNumberErrorText = "Enter a valid 10-digit phone number";
      });
    } else {
      setState(() {
        _phoneNumberErrorText = null;
      });
    }
  }

  UserDetailsProvider? userScreenProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initCall();
    });
    super.initState();
  }

  @override
  void dispose() {
    userScreenProvider?.otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void initCall() {
    userScreenProvider =
        Provider.of<UserDetailsProvider>(context, listen: false);
    userScreenProvider?.fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDetailsProvider>(
        builder: (context, userScreenProvider, child) {
      return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffFBBEBE),
        body: Stack(
          children: [
            // Background Image
            Container(
              margin: const EdgeInsets.all(120),
              child: Image.asset(
                'assets/images/splash_screen.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // White Container with Rounded Top
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height - 550),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 300,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Let’s get Started!",
                            style: GoogleFonts.roboto(
                                fontSize: 24,
                                color: const Color(0xff383838),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Enter your mobile number to \n               receive OTP:",
                            style: GoogleFonts.roboto(
                                fontSize: 17,
                                color: const Color(0xff706D6D),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              controller:
                                  userScreenProvider.phoneNumberController,
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0xff706D6D),
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: const Color(0xff706D6D),
                                    fontWeight: FontWeight.w500),
                                labelStyle: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: const Color(0xff706D6D),
                                    fontWeight: FontWeight.w500),
                                prefix: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    '+91',
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: const Color(0xff706D6D),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffD9D9D9)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),

                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),

                                labelText: 'Phone Number',
                                errorText: _phoneNumberErrorText,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                              ),
                              onChanged: _validatePhoneNumber,
                              onSubmitted: (value) {

                              },
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                            ),
                          ),
                          _buildPinPutExample(
                              userScreenProvider: userScreenProvider)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPinPutExample(
      {required UserDetailsProvider userScreenProvider}) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  length: 6,
                  controller: userScreenProvider.otpController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    return value ==
                            Provider.of<UserDetailsProvider>(context,
                                    listen: false)
                                .generatedOtp
                        ? null
                        : 'Pin is incorrect';
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Resend OTP in 30 seconds',
                style: GoogleFonts.lato(
                    fontSize: 16,
                    color: const Color(0xff706D6D),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffB41854)),
                      onPressed: _onPressedButton,
                      child: Text(
                        userScreenProvider.userExist ? 'Login' : 'Sign In',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamilyConstants.latoRegular,
                            fontSize: 16),
                      )))
            ],
          ),
        ),
        if (isLoading) const Center(child: CircularProgressIndicator())
      ],
    );
  }

  void _onPressedButton() async {
    isLoading = true;
    String phoneNumber = userScreenProvider!.phoneNumberController.text.trim();
    String otp = userScreenProvider!.generatedOtp;
    if (phoneNumber.isNotEmpty && phoneNumber.length == 10 && otp.isNotEmpty) {
      if (sendOTP == false) {
        await Fast2SMSService.sendSMS(
            'Your OTP for GlowME login is $otp. This OTP will expire in 10 minutes.',
            phoneNumber);
        sendOTP = true;
      } else if (sendOTP == true &&
          otp == userScreenProvider!.otpController.text) {
        await SharedPreference.setData(IS_AUTH, true);
        userScreenProvider?.signInUser();
        context.go(home);
        sendOTP = false;
      } else {
        Fluttertoast.showToast(msg: 'Invalid OTP request');
        sendOTP = false;
      }
    } else {
      Fluttertoast.showToast(msg: 'Please enter valid number');
      sendOTP = false;
    }
    isLoading = false;
    setState(() {});
  }
}
