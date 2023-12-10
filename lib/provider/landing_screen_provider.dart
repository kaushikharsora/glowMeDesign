import 'dart:core';

import 'package:flutter/material.dart';
import 'package:glowme/model/banner_model.dart';
import 'package:glowme/model/service_model.dart';
import 'package:glowme/model/vendor_model.dart';
import 'package:glowme/service/all%20services/all_services.dart';
import 'package:glowme/service/banner/banner.dart';
import 'package:glowme/service/vendor/vendor.dart';

class LandingScreenProvider extends ChangeNotifier {
  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;

  BannerModel? _fetchBanner;
  Service? _fetchService;
  Vendor? _vendorService;

  // ------------getters---------
  BannerModel? get fetchBanner => _fetchBanner;
  Service? get fetchService => _fetchService;
  Vendor? get vendorService => _vendorService;

  // ------------setters---------

  void setBanner(value) {
    _fetchBanner = value;
    notifyListeners();
  }

  void setService(value) {
    _fetchService = value;
   
    notifyListeners();
  }
  void setVendor(value) {
    _vendorService = value;
 
    notifyListeners();
  }

// --------------- API Calls------------

  void setBottomNavIndex(index) {
    _bottomNavIndex = index;

    notifyListeners();
  }

  void fetchAllBanner() {
    BannerApi.fetchAllBanners().then((value) {
      setBanner(value);
    });
  }

  void fetchAllService() {
  
    ServiceApi.fetchAllService().then((value) {
      
      setService(value);
    });
  }
 void fetchAllVendors() {
  print('calling this function');
  VendorApi.fetchAllVendor().then((value) {
    print('dataaa here ::::: ${value.data}');
    setVendor(value);
  }).catchError((error) {
    print('Error during fetchAllVendor: $error');
  });
}

}
