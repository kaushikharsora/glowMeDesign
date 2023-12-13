import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/constants/constants.dart';
import 'package:glowme/constants/font_family_constants.dart';
import 'package:glowme/constants/image.dart';
import 'package:glowme/service/preference_service/preferences.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<ProfileDataModel> profileDataList = [];

  @override
  void initState() {
    profileDataList = [
      ProfileDataModel(
          icon: ImageConstants.icEditProfile,
          title: 'Edit Profile',
          isArrowKey: true),
      ProfileDataModel(
          icon: ImageConstants.icViewBooking,
          title: 'View Bookings',
          isArrowKey: true),
      ProfileDataModel(
          icon: ImageConstants.icWishList, title: 'Wishlist', isArrowKey: true),
      ProfileDataModel(icon: ImageConstants.icHelpFaq, title: 'Help & FAQ'),
      ProfileDataModel(icon: ImageConstants.icDelete, title: 'Delete Account'),
      ProfileDataModel(icon: ImageConstants.icLogOut, title: 'Logout'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 18,
            )),
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamilyConstants.robotoRegular,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffB41854),
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            height: 87,
            width: 87,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white70,
              size: 50,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Test User',
            style: TextStyle(
                fontFamily: FontFamilyConstants.robotoRegular,
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: profileDataList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if(index == 4 || index == 5){
                       await SharedPreference.setData(IS_AUTH, false);
                       context.go(signIn);
                      }
                    },
                    child: _buildCommonItem(
                        index: index, itemList: profileDataList));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommonItem(
      {required int index, required List<ProfileDataModel> itemList}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: Offset.zero,
                color: const Color(0xff383838).withOpacity(0.08),
                blurRadius: 12,
                spreadRadius: 0),
          ]),
      child: Row(
        children: [
          SvgPicture.asset(
            itemList[index].icon,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 15),
          Expanded(
              child: Text(
            itemList[index].title,
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: Color(0xff383838),
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: FontFamilyConstants.latoRegular),
          )),
          if (itemList[index].isArrowKey == true)
            SvgPicture.asset(
              ImageConstants.icForward,
              height: 20,
              width: 20,
            ),
        ],
      ),
    );
  }
}

class ProfileDataModel {
  String icon;
  String title;
  bool? isArrowKey;

  ProfileDataModel(
      {required this.icon, required this.title, this.isArrowKey = false});
}
