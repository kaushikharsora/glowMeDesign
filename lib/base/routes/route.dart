import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route_url.dart';
import 'package:glowme/screens/appointment_calender.dart';
import 'package:glowme/screens/home/filters_vendor.dart';
import 'package:glowme/screens/home/home_page.dart';
import 'package:glowme/screens/home/home_page_layout.dart';
import 'package:glowme/screens/home/order_confirmation_page.dart';
import 'package:glowme/screens/home/order_summary_page.dart';
import 'package:glowme/screens/home/user_address_page.dart';
import 'package:glowme/screens/home/vendor_profile.dart';
import 'package:glowme/screens/services/all_services_page.dart';
import 'package:glowme/screens/sign-in/sign_in_screen.dart';
import 'package:glowme/screens/splash_screen.dart';
import 'package:glowme/screens/user_profile/user_profile.dart';
import 'package:glowme/screens/wallet/wallet_screen.dart';
import 'package:go_router/go_router.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();
final router = GoRouter(navigatorKey: _parentKey, routes: [
  GoRoute(
    path: splashScreen,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: signIn,
    builder: (context, state) => const SignInScreen(),
  ),
  ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) {
      
        state.pageKey;
        return HomePage(child: child);
      },
      routes: [
       GoRoute(
          path: home,
          builder: (context, state) => const HomePageLayout(),
        ),
        GoRoute(
          path: allservices,
          builder: (context, state) => const AllServices(),
        ),
        GoRoute(
          path: allservices,
          builder: (context, state) => const AllServices(),
        ),
        GoRoute(
          path: appointmentCalendar,
          builder: (context, state) => const AppointmentCalendar(),
        ),
        GoRoute(
          path: filteredVendor,
          builder: (context, state) => const FilteredVendors(),
        ),
        GoRoute(
          path: vendorProfile,
          builder: (context, state) =>  const ProfilePage(),
        ),
        GoRoute(
          path: orderSummary,
          builder: (context, state) =>   const OrderSummaryScreen(),
        ),
        GoRoute(
          path: userAddress,
          builder: (context, state) =>   const UserAddressPage(),
        ),
        GoRoute(
          path: profilePage,
          builder: (context, state) => const UserProfileScreen(),
        ),
        GoRoute(
          path: walletPage,
          builder: (context, state) => const WalletPage(),
        ),GoRoute(
          path: orderConfirmationPage,
          builder: (context, state) => const OrderConfirmationPage(),
        ),
      ])
]);
