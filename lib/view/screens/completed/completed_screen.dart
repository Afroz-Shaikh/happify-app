import 'package:flutter/material.dart';
import 'package:happify_app/controller/question_controller.dart';
import 'package:happify_app/utilities/route_utilities.dart';
import 'package:happify_app/utilities/utilities.dart';
import 'package:happify_app/view/widgets/images/custom_image_view.dart';

class CompleteScreen extends StatelessWidget {
  CompleteScreen({Key? key}) : super(key: key);
  QuestionsController _questionsController =
      Get.find(tag: QuestionsController().toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtilities.whiteTextColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Container(
                    child: CustomImageView(
                        imageUrl: AssetUtilities.rightclickIcon)),
                Text(
                  "Completed ${_questionsController.finalScore.toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                  style: FontStyleUtilities.h22(
                    fontColor: ColorUtilities.primaryTextColor,
                    fontWeight: FWT.bold,
                  ),
                ),
                SizedBox(height: 20),
                _questionsController.finalScore >= 75
                    ? Column(
                        children: [
                          Text(
                            "Congrats, you did well today",
                            textAlign: TextAlign.center,
                            style: FontStyleUtilities.h22(
                              fontColor: ColorUtilities.primaryTextColor,
                              fontWeight: FWT.semiBold,
                            ),
                          ),
                          Container(
                              height: 200,
                              child: CustomImageView(
                                  imageUrl:
                                      AssetUtilities.completedMusicImage)),
                        ],
                      )
                    : _questionsController.finalScore < 75 &&
                            _questionsController.finalScore >= 50
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Tasks",
                                  style: FontStyleUtilities.h18(
                                    fontWeight: FWT.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imageUrl: AssetUtilities.newCourseImage,
                                        width: 50,
                                        height: 50,
                                        radius: BorderRadius.circular(100),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Take up a new course",
                                              style: FontStyleUtilities.h14(
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            Text(
                                              "take up something new",
                                              style: FontStyleUtilities.h12(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imageUrl: AssetUtilities.creativeImage,
                                        width: 50,
                                        height: 50,
                                        radius: BorderRadius.circular(100),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Do something creative",
                                              style: FontStyleUtilities.h14(
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            Text(
                                              "try to do something creative",
                                              style: FontStyleUtilities.h12(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imageUrl: AssetUtilities.trendTechImage,
                                        width: 50,
                                        height: 50,
                                        radius: BorderRadius.circular(100),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Start learning a trendy technology",
                                              style: FontStyleUtilities.h14(
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            Text(
                                              "learn something that is trending",
                                              style: FontStyleUtilities.h12(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imageUrl: AssetUtilities.podcastImage,
                                        width: 50,
                                        height: 50,
                                        radius: BorderRadius.circular(100),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Listen to an inspiring podcast",
                                              style: FontStyleUtilities.h14(
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            Text(
                                              "for 30 mins",
                                              style: FontStyleUtilities.h12(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Tasks",
                                  style: FontStyleUtilities.h18(
                                    fontWeight: FWT.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imageUrl: AssetUtilities.walkImage,
                                        width: 50,
                                        height: 50,
                                        radius: BorderRadius.circular(100),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Go For a Walk.",
                                              style: FontStyleUtilities.h14(
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            Text(
                                              "At leat 10 mins.",
                                              style: FontStyleUtilities.h12(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imageUrl: AssetUtilities.talkImage,
                                        width: 50,
                                        height: 50,
                                        radius: BorderRadius.circular(100),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Talk to a friend",
                                              style: FontStyleUtilities.h14(
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            Text(
                                              "Talk to someone close to you and share your problems",
                                              style: FontStyleUtilities.h12(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imageUrl: AssetUtilities.listenImage,
                                        width: 50,
                                        height: 50,
                                        radius: BorderRadius.circular(100),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Listen to  your favorite Music",
                                              style: FontStyleUtilities.h14(
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            Text(
                                              "At leat 30 mins.",
                                              style: FontStyleUtilities.h12(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imageUrl: AssetUtilities.readImage,
                                        width: 50,
                                        height: 50,
                                        radius: BorderRadius.circular(100),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Read a Book",
                                              style: FontStyleUtilities.h14(
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            Text(
                                              "At leat 30 mins.",
                                              style: FontStyleUtilities.h12(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(RouteUtilities.homeScreen);
                  },
                  child: Text("Go To Home"),
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Padding(
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //         child: Text(
                //           "Your Tasks",
                //           textAlign: TextAlign.center,
                //           style: FontStyleUtilities.h22(
                //             fontColor: ColorUtilities.primaryTextColor,
                //             fontWeight: FWT.semiBold,
                //           ),
                //         )),
                //     Container(
                //       height: 500,
                //       child: ListView.builder(
                //           itemCount: activityList.length,
                //           itemBuilder: (context, index) {
                //             return ListTile(
                //               title: Text(
                //                 activityList[index].title,
                //                 style: FontStyleUtilities.h16(
                //                   fontColor: ColorUtilities.primaryTextColor,
                //                   fontWeight: FWT.semiBold,
                //                 ),
                //               ),
                //               subtitle: Text(
                //                 activityList[index].subtitle,
                //               ),
                //               leading: Container(
                //                   width: 60,
                //                   height: 60,
                //                   child: CustomImageView(
                //                       radius: BorderRadius.circular(30),
                //                       imageUrl: AssetUtilities.readImage)),
                //             );
                //           }),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}

class Activity {
  String title;
  String image;
  String subtitle;

  Activity({required this.image, required this.title, required this.subtitle});
}

List<Activity> activityList = [
  Activity(
      image: AssetUtilities.walkImage,
      title: "Go for a Walk",
      subtitle: "At least 10 mins"),
  Activity(
      image: AssetUtilities.talkImage,
      title: "Talk to a friend",
      subtitle: "At least 10 mins"),
  Activity(
      image: AssetUtilities.listenImage,
      title: "Listen to Music",
      subtitle: "At least 10 mins"),
  Activity(
      image: AssetUtilities.readImage,
      title: "Read a Book",
      subtitle: "At least 10 mins"),
];
