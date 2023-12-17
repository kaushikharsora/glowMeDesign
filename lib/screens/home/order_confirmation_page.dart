import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/colors.dart';
import 'package:glowme/constants/font_family_constants.dart';
import 'package:glowme/constants/image.dart';
import 'package:go_router/go_router.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addressAppBar(),
      body: _bodyView(),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildBottomButton(onTap: () {}, btnText: 'Cancel Service'),
          ],
        ),
      ),
    );
  }

  AppBar addressAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.go(userAddress);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.white,
          )),
      backgroundColor: const Color(0xffB41854),
      centerTitle: true,
      title: const Text(
        'Order Confirmation',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamilyConstants.robotoRegular,
            color: Colors.white),
      ),
    );
  }

  Widget _bodyView() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset(ImageConstants.imageConfirmOrder,
                  height: 150, width: 150)),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'Thank you!',
              style: TextStyle(
                  color: gray01,
                  fontSize: 24,
                  fontFamily: FontFamilyConstants.robotoRegular,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'Your Appointment has been \nsuccessfully booked with Reema \nDeshmukh',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: gray02,
                  fontSize: 13,
                  fontFamily: FontFamilyConstants.latoRegular,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 36),
          Text(
            'Order Details (1 item)',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: gray01,
                fontSize: 13,
                fontFamily: FontFamilyConstants.robotoRegular,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          _buildArtistDetailsView(),
          const SizedBox(height: 16),
          Text(
            'Address Details',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: gray01,
                fontSize: 13,
                fontFamily: FontFamilyConstants.robotoRegular,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          _buildAddressList(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildAddressList() {
    return Flexible(
      child: ListView.separated(
        itemCount: 1,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset.zero,
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6),
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  splashRadius: 0,
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  fillColor: const MaterialStatePropertyAll(Color(0xffB41854)),
                  value: index,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    selectedOption = value!;
                    setState(() {});
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Deeksha Nagarkar',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamilyConstants.robotoRegular,
                          fontSize: 13,
                          color: Color(0xff383838),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Plot No 22, 220, Ujjwal House, Near Reliance fresh, Manish Nagar, Nagpur-440010',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConstants.latoRegular,
                          fontSize: 13,
                          color: Color(0xff706D6D),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: const TextSpan(
                            text: 'Mobile: ',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: FontFamilyConstants.latoRegular,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff706D6D),
                            ),
                            children: [
                              TextSpan(
                                text: '9900881192',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: FontFamilyConstants.latoRegular,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff383838),
                                ),
                              )
                            ]),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _openPopUp();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(34),
                                border: Border.all(
                                    color: const Color(0xffD1D1D6), width: 1),
                              ),
                              child: const Text(
                                'Remove',
                                style: TextStyle(
                                    color: Color(0xff383838),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: FontFamilyConstants.latoRegular,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              print('edit');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(34),
                                border: Border.all(
                                    color: const Color(0xffD1D1D6), width: 1),
                              ),
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                    color: Color(0xff383838),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: FontFamilyConstants.latoRegular,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(child: SizedBox(width: 8)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _openPopUp() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          backgroundColor: const Color(0xff383838).withOpacity(.75),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Remove Address?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamilyConstants.robotoRegular,
                          fontSize: 16,
                          color: Color(0xff383838)),
                    ),
                    InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: const Icon(Icons.close,
                            color: Color(0xffB41854), size: 26))
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Are you sure you want to remove the address?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamilyConstants.latoRegular,
                      fontSize: 13,
                      color: Color(0xff706D6D)),
                ),
                const SizedBox(height: 12 * 2),
                Row(
                  children: [
                    Expanded(
                        child: _buildBottomButton(
                            onTap: () {
                              context.pop();
                            },
                            btnText: 'Cancel',
                            btnColor: const Color(0xffF9C5C5))),
                    const SizedBox(width: 7),
                    Expanded(
                        child: _buildBottomButton(
                            onTap: () {
                              context.pop();
                            },
                            btnText: 'Confirm')),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomButton(
      {required Function() onTap, required String btnText, Color? btnColor}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: btnColor ?? const Color(0xffB41854),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          btnText,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: FontFamilyConstants.latoRegular,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildArtistDetailsView() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
