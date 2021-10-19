import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happify_app/utilities/route_utilities.dart';
import 'package:happify_app/utilities/utilities.dart';
import 'package:happify_app/utilities/variable_utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// [Timer]
  Timer? _timer;

  void changeSplash() async {
    _timer = Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        String userId = VariableUtilities.prefs?.read("UserId") ?? "";
        print(userId);
        if (userId != "") {
          _timer?.cancel();
          Get.toNamed(RouteUtilities.homeScreen);
        } else {
          _timer?.cancel();

          Get.toNamed(RouteUtilities.loginScreen);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    changeSplash();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Happify",
          style: FontStyleUtilities.h44(
            fontWeight: FWT.bold,
            fontColor: ColorUtilities.blueTextColor,
          ),
        ),
      ),
    );
  }
}
