import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/utilities/assets_utilities.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteUtilities.loginScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          const Align(
              alignment: Alignment.center,
              child: Image(image: AssetImage(AssetUtilities.applicationLogo)))
        ],
      ),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetUtilities.spalshImage),
              fit: BoxFit.cover)),
    ));
  }
}
