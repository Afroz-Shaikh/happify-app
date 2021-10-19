import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:happify_app/controller/login_controller.dart';
import 'package:happify_app/utilities/route_utilities.dart';
import 'package:happify_app/utilities/utilities.dart';
import 'package:happify_app/view/widgets/images/custom_image_view.dart';
import 'package:happify_app/view/widgets/network_loader.dart';

class LoginScreen extends StatelessWidget {
  LoginController _loginController =
      Get.find(tag: LoginController().toString());

  @override
  Widget build(BuildContext context) {
    VariableUtilities.screenSize = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
        init: _loginController,
        builder: (_) => NetworkLoader(
              visibility: _loginController.isLoading,
              child: Scaffold(
                backgroundColor: ColorUtilities.whiteTextColor,
                body: Center(
                    child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 40),
                            Container(
                              height: 160,
                              child: CustomImageView(
                                  imageUrl: AssetUtilities.splashImage),
                            ),
                            Text(
                              "Monitor your Mood daily and keep a track of it",
                              textAlign: TextAlign.center,
                              style: FontStyleUtilities.h18(
                                fontColor: ColorUtilities.blueTextColor,
                                fontWeight: FWT.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await VariableUtilities.googleSignIn.signOut();
                                VariableUtilities.googleSignIn
                                    .signIn()
                                    .then((GoogleSignInAccount? value) {
                                  if (value != null) {
                                    value.authentication.then(
                                        (GoogleSignInAuthentication
                                            auth) async {
                                      _loginController.email = value.email;
                                      _loginController.profileImageUrl = value
                                              .photoUrl ??
                                          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/271deea8-e28c-41a3-aaf5-2913f5f48be6/de7834s-6515bd40-8b2c-4dc6-a843-5ac1a95a8b55.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI3MWRlZWE4LWUyOGMtNDFhMy1hYWY1LTI5MTNmNWY0OGJlNlwvZGU3ODM0cy02NTE1YmQ0MC04YjJjLTRkYzYtYTg0My01YWMxYTk1YThiNTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.BopkDn1ptIwbmcKHdAOlYHyAOOACXW0Zfgbs0-6BY-E";
                                      _loginController.userName =
                                          value.displayName ?? "User";

                                      AuthCredential c =
                                          GoogleAuthProvider.credential(
                                              accessToken: auth.accessToken,
                                              idToken: auth.idToken);
                                      bool? val = await _loginController.login(
                                          token: c);

                                      if (val == null || val) {
                                        Get.toNamed(RouteUtilities.homeScreen);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Error To create Account!\nPlease close application and try again leter after some time."),
                                          ),
                                        );
                                      }
                                    });
                                  }
                                });
                              },
                              child: Container(
                                  height: 50,
                                  margin: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: ColorUtilities.whiteTextColor,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorUtilities.greyboxColor,
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: CustomImageView(
                                            imageUrl:
                                                AssetUtilities.googleLogoImage),
                                      ),
                                      Text(
                                        "LOGIN WITH GOOGLE",
                                        textAlign: TextAlign.center,
                                        style: FontStyleUtilities.h14(
                                          fontColor:
                                              ColorUtilities.primaryTextColor,
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ))),
              ),
            ));
  }
}
