import 'package:flutter/material.dart';
import 'package:happify_app/controller/login_controller.dart';
import 'package:happify_app/utilities/route_utilities.dart';
import 'package:happify_app/utilities/utilities.dart';
import 'package:happify_app/view/widgets/button/custom.button.dart';
import 'package:happify_app/view/widgets/network_loader.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  LoginController _loginController =
      Get.find(tag: LoginController().toString());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: _loginController,
        builder: (_) => NetworkLoader(
              visibility: _loginController.isLoading,
              child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppbar(appBarTitle: "Profile"),
                      Center(
                        child: GetBuilder<LoginController>(
                          init: _loginController,
                          builder: (_) => Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    _loginController.profileImageUrl),
                                maxRadius: 60,
                              ),
                              SizedBox(height: 10),
                              Text(
                                _loginController.userName,
                                style: FontStyleUtilities.h18(
                                    fontWeight: FWT.bold),
                              ),
                              Text(_loginController.email),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RouteUtilities.aboutScreen);
                        },
                        child: Text(
                          "About",
                          textAlign: TextAlign.center,
                          style: FontStyleUtilities.h16(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Help",
                          textAlign: TextAlign.center,
                          style: FontStyleUtilities.h16(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terms & Conditions",
                          textAlign: TextAlign.center,
                          style: FontStyleUtilities.h16(),
                        ),
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: CustomButton(
                          title: "LOGOUT",
                          buttonColor: ColorUtilities.subButtonColor,
                          onButtonTap: () async {
                            if (await _loginController.logout()) {
                              Get.offAllNamed(RouteUtilities.splashScreen);
                            }
                            ;
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
