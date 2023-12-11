import 'package:flutter/material.dart';
import 'package:glowme/base/routes/route.dart';
import 'package:glowme/constants/constants.dart';
import 'package:glowme/provider/landing_screen_provider.dart';
import 'package:glowme/provider/user_provider.dart';
import 'package:provider/provider.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
        ChangeNotifierProvider(create: (_) => LandingScreenProvider())
      ],
      child: MaterialApp.router(
        title: GLOW_ME,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
