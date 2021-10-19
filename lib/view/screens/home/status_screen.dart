import 'package:flutter/material.dart';
import 'package:happify_app/controller/question_controller.dart';
import 'package:happify_app/model/records_data_model/records_data_model.dart';
import 'package:happify_app/utilities/utilities.dart';
import 'package:happify_app/view/widgets/network_loader.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  void initState() {
    _questionsController.getStatus();
    super.initState();
  }

  QuestionsController _questionsController =
      Get.find(tag: QuestionsController().toString());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      init: _questionsController,
      builder: (_) => NetworkLoader(
        visibility: _questionsController.isLoading,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  appBarTitle: "Stats",
                ),
                SizedBox(height: 10),
                Text(
                  "Mood Over Time",
                  style: FontStyleUtilities.h18(),
                ),
                SizedBox(height: 10),
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: const Color(0xFF1654AC),
                      child: GetBuilder<QuestionsController>(
                        init: _questionsController,
                        builder: (_) {
                          return BarChart(
                            data: _questionsController.statusDataList,
                          );
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  final List<RecordsDataModel> data;

  BarChart({Key? key, required this.data}) : super(key: key);

  String getDayName(int value) {
    switch (value) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
      default:
        return "Sun";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.blue,

      /// change colors for background...
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        ColumnSeries<RecordsDataModel, String>(
          dataSource: data,
          xValueMapper: (RecordsDataModel data, _) =>
              getDayName(DateTime.parse(data.dateTime).weekday),
          yValueMapper: (RecordsDataModel data, _) => data.pr,
        ),
      ],
    );
  }
}
