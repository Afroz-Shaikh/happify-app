import 'package:flutter/material.dart';
import 'package:happify_app/controller/question_controller.dart';
import 'package:happify_app/utilities/route_utilities.dart';
import 'package:happify_app/utilities/utilities.dart';
import 'package:happify_app/view/widgets/button/custom.button.dart';
import 'package:happify_app/view/widgets/network_loader.dart';

class Question1 extends StatefulWidget {
  const Question1({Key? key}) : super(key: key);

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  QuestionsController _questionsController =
      Get.find(tag: QuestionsController().toString());

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _questionsController.getQuestions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
        init: _questionsController,
        builder: (_) => NetworkLoader(
              visibility: _questionsController.isLoading,
              child: Scaffold(
                body: GetBuilder<QuestionsController>(
                    init: _questionsController,
                    builder: (_) {
                      if (_questionsController.questionList.length <= 0) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomAppbar(
                              appBarTitle: "",
                              onBackTap: () {
                                Get.back();
                              },
                            ),
                            SizedBox(height: 20),
                            Text(
                              (_questionsController.questionList[
                                      _questionsController.currentQuestionIndex]
                                  .data() as Map)["Question"],
                              textAlign: TextAlign.center,
                              style: FontStyleUtilities.h22(
                                fontColor: ColorUtilities.primaryTextColor,
                                fontWeight: FWT.bold,
                              ),
                            ),
                            GetBuilder(
                              init: _questionsController,
                              builder: (_) => SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: ColorUtilities.primaryTextColor,
                                    trackHeight: 10,
                                    tickMarkShape:
                                        SliderTickMarkShape.noTickMark),
                                child: Slider(
                                  value: _questionsController.answers[
                                      (_questionsController.questionList[
                                              _questionsController
                                                  .currentQuestionIndex]
                                          .data() as Map)["Question"]],
                                  min: 0,
                                  max: 10,
                                  label: _questionsController.answers[
                                          (_questionsController.questionList[
                                                  _questionsController
                                                      .currentQuestionIndex]
                                              .data() as Map)["Question"]]
                                      .round()
                                      .toString(),
                                  divisions: 10,
                                  onChanged: (value) {
                                    _questionsController.updateAnswer(
                                        (_questionsController.questionList[
                                                _questionsController
                                                    .currentQuestionIndex]
                                            .data() as Map)["Question"],
                                        value);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            CustomButton(
                              title: "Continue",
                              width: 200,
                              onButtonTap: () async {
                                if (_questionsController.currentQuestionIndex <
                                    _questionsController.questionList.length -
                                        1) {
                                  _questionsController.currentQuestionIndex =
                                      _questionsController
                                              .currentQuestionIndex +
                                          1;

                                  _questionsController
                                          .currentSliderProgressIndex =
                                      _questionsController
                                              .currentSliderProgressIndex +
                                          10;
                                  print(_questionsController
                                      .currentSliderProgressIndex);
                                } else {
                                  print("asdadsasdasd");
                                  await _questionsController.addEntrie();
                                  Get.toNamed(RouteUtilities.completedScreen);
                                }
                              },
                            ),
                            SliderTheme(
                              data: SliderThemeData(
                                  trackHeight: 10,
                                  inactiveTrackColor:
                                      ColorUtilities.greyboxColor,
                                  thumbShape: SliderComponentShape.noThumb,
                                  tickMarkShape:
                                      SliderTickMarkShape.noTickMark),
                              child: Slider(
                                value: _questionsController
                                    .currentSliderProgressIndex,
                                min: 00,
                                max: _questionsController.questionList.length *
                                    10,
                                divisions:
                                    _questionsController.questionList.length,
                                onChanged: (_) {},
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ));
  }
}
