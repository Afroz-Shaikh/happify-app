import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happify_app/controller/question_controller.dart';
import 'package:happify_app/utilities/utilities.dart';
import 'package:happify_app/view/screens/question/question1.dart';
import 'package:happify_app/view/widgets/button/custom.button.dart';
import 'package:happify_app/view/widgets/button/custom_appbar.dart';
import 'package:happify_app/view/widgets/images/custom_image_view.dart';

class PageviewScreen extends StatelessWidget {
  PageviewScreen({Key? key}) : super(key: key);

  QuestionsController _questionsController =
      Get.find(tag: QuestionsController().toString());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      init: _questionsController,
      builder: (_) => Scaffold(
          body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              appBarTitle: "",
              onBackTap: () {
                Get.back();
              },
            ),
            SizedBox(height: 100),
            _questionsController.isTodayEntryDone
                ? Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "You already recorded entry for today !",
                          textAlign: TextAlign.center,
                          style: FontStyleUtilities.h18(
                            fontColor: ColorUtilities.primaryTextColor,
                            fontWeight: FWT.semiBold,
                          ),
                        ),
                        Container(
                            height: 200,
                            child: CustomImageView(
                                imageUrl: AssetUtilities.triengleImage)),
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
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Ready to talk about your feelings ?",
                          textAlign: TextAlign.center,
                          style: FontStyleUtilities.h22(
                            fontColor: ColorUtilities.primaryTextColor,
                            fontWeight: FWT.bold,
                          ),
                        ),
                        Spacer(),
                        CustomButton(
                          title: "Add Entry",
                          width: 300,
                          onButtonTap: () {
                            Get.to(Question1());
                          },
                        )
                      ],
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
