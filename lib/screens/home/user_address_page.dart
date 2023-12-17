import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/constants.dart';
import 'package:glowme/constants/font_family_constants.dart';
import 'package:glowme/model/user_model.dart';
import 'package:go_router/go_router.dart';

class UserAddressPage extends StatefulWidget {
  const UserAddressPage({super.key});

  @override
  State<UserAddressPage> createState() => _UserAddressPageState();
}

class _UserAddressPageState extends State<UserAddressPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final pinController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  double latitude = 0.0;
  double longitude = 0.0;
  bool _isCheckDefault = false;
  bool isAddAddress = false;
  int selectedOption = 1;
  UserDetails? userDetails;

  @override
  void initState() {
    _getUserAddresses();
    super.initState();
  }

  void _getUserAddresses() {
    userDetails = UserDetails(users: [
      User(
        id: 'u01',
        phoneNumber: '7383636550',
        fullName: 'Kaushik Harsora',
        email: 'kbharsora1999@gmail.com',
        addresses: Addresses(
          home: Home(
              type: HOME_ADDRESS,
              street: 'Panchavati, Rajput Street, Vaghani Chowk',
              city: 'Vallabhipur, Bhavnagar, Gujarat',
              pincode: '364310'),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addressAppBar(),
      resizeToAvoidBottomInset: false,
      body: isAddAddress ? _addAddressView() : _buildUserAddressListView(),
    );
  }

  AppBar addressAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.go(home);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.white,
          )),
      backgroundColor: const Color(0xffB41854),
      centerTitle: true,
      title: const Text(
        'Address',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamilyConstants.robotoRegular,
            color: Colors.white),
      ),
    );
  }

  Widget _addAddressView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Address',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: FontFamilyConstants.robotoRegular,
                fontSize: 13,
                color: Color(0xff383838)),
          ),
          const SizedBox(height: 8),
          _buildTextField(
              hintText: 'Name*',
              controller: nameController,
              keyboardType: TextInputType.name),
          _buildTextField(
              hintText: 'Mobile No*',
              controller: mobileController,
              keyboardType: TextInputType.phone),
          _buildTextField(
              hintText: 'Pin Code*',
              controller: pinController,
              keyboardType: TextInputType.phone),
          _buildTextField(
              hintText: 'Address(House No, Building, Street, Area)*',
              controller: addressController,
              keyboardType: TextInputType.streetAddress),
          Row(
            children: [
              Expanded(
                  child: _buildTextField(
                      hintText: 'City*',
                      controller: cityController,
                      keyboardType: TextInputType.streetAddress)),
              const SizedBox(width: 9),
              Expanded(
                  child: _buildTextField(
                      hintText: 'State*',
                      controller: stateController,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.done)),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Select Address on Map',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: FontFamilyConstants.robotoRegular,
                fontSize: 13,
                color: Color(0xff383838)),
          ),
          const SizedBox(height: 16),
          _buildMapView(),
          const SizedBox(height: 16),
          _buildSelectDefaultView(),
          const SizedBox(height: 24),
          _buildBottomButton(
              onTap: () {
                if (nameController.text.trim().isEmpty) {
                  Fluttertoast.showToast(msg: 'Please enter name');
                } else if (mobileController.text.trim().isEmpty) {
                  Fluttertoast.showToast(msg: 'Please enter mobile no.');
                } else if (pinController.text.trim().isEmpty) {
                  Fluttertoast.showToast(
                      msg: 'Please enter your city pin code');
                } else if (addressController.text.trim().isEmpty) {
                  Fluttertoast.showToast(msg: 'Please enter your address');
                } else if (cityController.text.trim().isEmpty) {
                  Fluttertoast.showToast(msg: 'Please enter your city');
                } else if (stateController.text.trim().isEmpty) {
                  Fluttertoast.showToast(msg: 'Please enter your state');
                } else {
                  _openPopUp(
                    args: 1,
                    changeView: (value) {
                      isAddAddress = value;
                      setState(() {});
                    },
                  );
                }
                setState(() {});
              },
              btnText: 'Add Address'),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String hintText,
      TextInputAction? textInputAction,
      TextInputType? keyboardType}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 16,
              spreadRadius: 0,
              color: const Color(0xff000000).withOpacity(0.08),
            )
          ]),
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: keyboardType ?? TextInputType.text,
        style: const TextStyle(
            fontSize: 13,
            fontFamily: FontFamilyConstants.latoRegular,
            fontWeight: FontWeight.w600,
            color: Color(0xff706D6D)),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
        ),
      ),
    );
  }

  Widget _buildMapView() {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff000000).withOpacity(0.15),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FlutterMap(
            options: MapOptions(
              maxZoom: 18,
              minZoom: 1,
              backgroundColor: const Color(0xff000000).withOpacity(0.15),
              onMapReady: () {},
              onMapEvent: (event) {},
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'http://mt0.google.com/vt/lyrs=m&hl=en&x={x}&y={y}&z={z}&s=Ga',
              ),
            ]),
      ),
    );
  }

  Widget _buildSelectDefaultView() {
    return Row(
      children: [
        Checkbox(
          value: _isCheckDefault,
          splashRadius: 0,
          side: const BorderSide(color: Color(0xffB41854), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: const BorderSide(color: Color(0xffB41854), width: 1.5),
          ),
          activeColor: const Color(0xffB41854),
          checkColor: Colors.white,
          onChanged: (value) {
            _isCheckDefault = value!;
            setState(() {});
          },
        ),
        const Expanded(
          child: Text(
            'Make this my Default Address',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: FontFamilyConstants.latoRegular,
                fontSize: 13,
                color: Color(0xff706D6D)),
          ),
        )
      ],
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

  Widget _buildUserAddressListView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {
              setState(() {
                isAddAddress = true;
              });
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                      color: const Color(0xffD9D9D9).withOpacity(0.4),
                      width: 1)),
              child: const Text(
                "Add New Address",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamilyConstants.latoRegular,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff383838)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _buildAddressList(),
          const SizedBox(height: 24),
          _buildBottomButton(
              onTap: () {
                context.go(orderConfirmationPage);
              },
              btnText: 'Book Service'),
        ],
      ),
    );
  }

  void _openPopUp({required int args, Function(bool)? changeView}) {
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
                    Text(
                      args == 1 ? 'Confirm Details?' : 'Remove Address?',
                      style: const TextStyle(
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
                Text(
                  args == 1
                      ? 'Are the address details correct?'
                      : 'Are you sure you want to remove the address?',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
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
                            btnText: args == 1 ? 'Edit Address' : 'Cancel',
                            btnColor: const Color(0xffF9C5C5))),
                    const SizedBox(width: 7),
                    Expanded(
                        child: _buildBottomButton(
                            onTap: () {
                              if (args == 1) {
                                // userDetails!.users!.add(User(
                                //     id: 'u${userDetails?.users!.length ?? 0 + 1}',
                                //   addresses:
                                // );
                                changeView!(false);
                              }
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

  Widget _buildAddressList() {
    return Flexible(
      child: ListView.separated(
        itemCount: userDetails?.users!.length ?? 0,
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
                              _openPopUp(args: 2);
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
}
