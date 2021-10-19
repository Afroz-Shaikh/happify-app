import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:happify_app/model/records_data_model/records_data_model.dart';
import 'package:happify_app/utilities/utilities.dart';

class QuestionsController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  double _currentSliderProgressIndex = 10;
  double get currentSliderProgressIndex => _currentSliderProgressIndex;
  set currentSliderProgressIndex(double value) {
    _currentSliderProgressIndex = value;
    update();
  }

  List<DocumentSnapshot> _questionList = [];
  List<DocumentSnapshot> get questionList => _questionList;
  set questionList(List<DocumentSnapshot> value) {
    _questionList = value;
    update();
  }

  Map<String, dynamic> _answers = {};
  Map<String, dynamic> get answers => _answers;
  set answers(Map<String, dynamic> value) {
    _answers = value;
    update();
  }

  updateAnswer(String question, double value) {
    _answers[question] = value;
    update();
  }

  getQuestions() async {
    this.isLoading = true;

    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("Questions").get();
    questionList = data.docs;

    questionList.forEach((DocumentSnapshot element) {
      answers.addAll({(element.data() as Map)["Question"]: 0.0});
    });

    this.isLoading = false;
  }

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;
  set currentQuestionIndex(int value) {
    _currentQuestionIndex = value;
    update();
  }

  double _finalScore = 0.0;
  double get finalScore => _finalScore;
  set finalScore(double value) {
    _finalScore = value;
    update();
  }

  Future<void> addEntrie() async {
    this.isLoading = true;

    try {
      String uid = VariableUtilities.prefs?.read("UserId");

      double result = 0.0;
      double total = (questionList.length * 10);
      double pr = 0.0;
      answers.forEach((key, value) {
        result = result + value;
      });

      pr = (result * 100) / total;
      this.finalScore = pr;
      String todayDate =
          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} 00:00:00.0000";
      if (!await getTodayEntry()) {
        await FirebaseFirestore.instance.collection("Records").add(
              RecordsDataModel(
                userId: uid,
                dateTime: todayDate,
                answers: answers,
                total: total,
                result: result,
                pr: pr,
                date: Timestamp.fromDate(DateTime.now()),
              ).toMap(),
            );
        this.isLoading = false;
      }
      this.isLoading = false;
    } catch (e) {
      this.isLoading = false;

      print(e);
    }
  }

  bool _isTodayEntryDone = false;
  bool get isTodayEntryDone => _isTodayEntryDone;
  set isTodayEntryDone(bool value) {
    _isTodayEntryDone = value;
    update();
  }

  Future<bool> getTodayEntry() async {
    this.isLoading = true;
    String uid = VariableUtilities.prefs?.read("UserId");

    String todayDate =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} 00:00:00.0000";
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection("Records")
        .where("date_time", isEqualTo: todayDate)
        .where("user_id", isEqualTo: uid)
        .get();

    this.isTodayEntryDone = data.docs.length >= 1;

    this.isLoading = false;

    return data.docs.length >= 1;
  }

  List<RecordsDataModel> _statusDataList = [];
  List<RecordsDataModel> get statusDataList => _statusDataList;
  set statusDataList(List<RecordsDataModel> value) {
    _statusDataList = value;
    update();
  }

  Future<void> getStatus() async {
    String uid = VariableUtilities.prefs?.read("UserId");
    DateTime date = DateTime.now().subtract(Duration(days: 12));
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection("Records")
        .where("date", isGreaterThan: date)
        .where("user_id", isEqualTo: uid)
        .get();
    statusDataList.clear();
    data.docs.forEach((DocumentSnapshot element) {
      print(element.data());
      statusDataList.add(
          RecordsDataModel.fromMap(element.data() as Map<String, dynamic>));
    });
    print(statusDataList);
    update();
  }
}
