// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:glowme/provider/user_provider.dart';
import 'package:glowme/service/all%20services/fast_to_sms_service.dart';
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
  void _validatePhoneNumber(String value) {
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

  @override
  void initState() {
    Provider.of<UserDetailsProvider>(context, listen: false).fetchAllUsers();

    super.initState();
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
                          const SizedBox(
                            height: 20,
                          ),
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
                                userScreenProvider.generateRandomOtp();
                              },
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                            ),
                          ),
                          PinputExample(userScreenProvider: userScreenProvider)
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
}

class PinputExample extends StatefulWidget {
  final UserDetailsProvider userScreenProvider;

  const PinputExample({super.key, required this.userScreenProvider});

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    widget.userScreenProvider.otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xffD9D9D9);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color(0xffD9D9D9);

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
    final userScreenProvifder =
        Provider.of<UserDetailsProvider>(context, listen: false);

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              controller: widget.userScreenProvider.otpController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                return value ==
                        Provider.of<UserDetailsProvider>(context, listen: false)
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
          const SizedBox(
            height: 20,
          ),
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
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xffB41854), // Set the background color here
                  ),
                  onPressed: () async {
                    //  userScreenProvifder
                    //       .signInUser();
                    //       Future.delayed(const Duration(seconds: 1)).then((value){
                    //         if(userScreenProvifder.userExist){
                    //         context.go(home);
                    //       }
                    //       });
                    //context.go(home);
                    String phoneNumber = widget.userScreenProvider.phoneNumberController.text.trim();
                    String otp = widget.userScreenProvider.generatedOtp;
                    if (phoneNumber.isNotEmpty && phoneNumber.length == 10) {
                      await Fast2SMSService.sendSMS(
                          'Your OTP for GlowME Wealth login is $otp. This OTP will expire in 10 minutes.',
                          phoneNumber);
                    } else {

                    }
                  },
                  child: Text(
                      userScreenProvifder.userExist ? 'Sign In' : 'Login')))
        ],
      ),
    );
  }
}

class LineWithCircleAndOr extends StatelessWidget {
  const LineWithCircleAndOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150.0, // Line width
          height: 1.0, // Line height
          color: Colors.black,
        ),
        const SizedBox(width: 10.0), // Spacer
        Container(
          width: 60.0, // Circle diameter
          height: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffD9D9D9), // Set the border color here
              width: 1.0, // Set the border width
            ),
          ),
          child: const Center(
            child: Text(
              "OR",
              style: TextStyle(
                color: Color(0xff383838),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0), // Spacer
        Container(
          width: 150.0, // Line width
          height: 1.0, // Line height
          color: Colors.black,
        ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100.0, // Circle diameter
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffD9D9D9), // Set the border color here
                width: 1.0, // Set the border width
              ),
            ),
            child: Center(child: Image.asset('assets/images/google_icon.png')),
          ),
          Container(
            width: 100.0, // Circle diameter
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffD9D9D9), // Set the border color here
                width: 1.0, // Set the border width
              ),
            ),
            child:
                Center(child: Image.asset('assets/images/facebook_icon.png')),
          ),
          Container(
            width: 100.0, // Circle diameter
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffD9D9D9), // Set the border color here
                width: 1.0, // Set the border width
              ),
            ),
            child: Center(child: Image.asset('assets/images/apple_icon.png')),
          ),
        ],
      ),
    );
  }
}
