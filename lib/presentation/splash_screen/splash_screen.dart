import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import '../resources/export_resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> screenKey = GlobalKey<ScaffoldState>();
  Timer? _timer;

  _startDelay() {
    _timer = Timer(Duration(seconds: 4), _goNext);
  }

  _goNext() {
    print("Splash screen");
    Navigator.pushNamedAndRemoveUntil(
      context,
      CustomRouteNames.kChooseAccountScreenRoute,
      (page) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              period: const Duration(milliseconds: 3000),
              baseColor: ColorManager.secondary,
              highlightColor: ColorManager.kWhiteColor,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppSize.sizeWidth(context) * 0.2,
                  right: AppSize.sizeWidth(context) * 0.2,
                ),
                child: Image.asset(
                  ImageAssets.appLogo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
