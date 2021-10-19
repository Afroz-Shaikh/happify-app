import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happify_app/controller/question_controller.dart';
import 'package:happify_app/utilities/utilities.dart';
import 'package:happify_app/view/screens/home/profile_screen.dart';
import 'package:happify_app/view/screens/home/status_screen.dart';
import 'package:happify_app/view/screens/pageview/pageview_screen.dart';
import 'package:happify_app/view/widgets/button/custom.button.dart';
import 'package:happify_app/view/widgets/images/custom_image_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [Home(), StatusScreen(), ProfileScreen()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          currentIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: ColorUtilities.blueTextColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: CustomImageView(
                imageUrl: currentIndex == 0
                    ? AssetUtilities.homeSelected
                    : AssetUtilities.homeUnselected,
                isFromAssets: true,
                height: 16,
              ),
            ),
            BottomNavigationBarItem(
              label: "Stats",
              icon: CustomImageView(
                imageUrl: currentIndex == 1
                    ? AssetUtilities.statusSelected
                    : AssetUtilities.statusUnselected,
                isFromAssets: true,
                height: 16,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: CustomImageView(
                imageUrl: currentIndex == 2
                    ? AssetUtilities.profileSelected
                    : AssetUtilities.profileUnselected,
                isFromAssets: true,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  QuestionsController _questionsController =
      Get.find(tag: QuestionsController().toString());

  @override
  void initState() {
    _questionsController.getTodayEntry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      init: _questionsController,
      builder: (_) => Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Happify",
                    textAlign: TextAlign.center,
                    style: FontStyleUtilities.h22(
                        fontColor: ColorUtilities.blueTextColor,
                        fontWeight: FWT.bold),
                  ),
                  // IconButton(onPressed: () {}, icon: Icon(Icons.list_rounded))
                ],
              ),
            ),
            Text(
              "Welcome back!",
              textAlign: TextAlign.center,
              style: FontStyleUtilities.h22(
                fontColor: ColorUtilities.primaryTextColor,
                fontWeight: FWT.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Answer some Questions & tell us about your day",
                    textAlign: TextAlign.center,
                    style: FontStyleUtilities.h18(
                      fontColor: ColorUtilities.primaryTextColor,
                      fontWeight: FWT.semiBold,
                    ),
                  ),
                  Container(
                      height: 200,
                      child: CustomImageView(
                          imageUrl: AssetUtilities.questionImage)),
                  CustomButton(
                      title: "Get Started",
                      width: 250,
                      onButtonTap: () {
                        Get.to(PageviewScreen());
                      })
                ],
              ),
              height: 359,
              decoration: BoxDecoration(
                  color: ColorUtilities.whiteTextColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: ColorUtilities.greyboxColor,
                        blurRadius: 5,
                        spreadRadius: 2)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
