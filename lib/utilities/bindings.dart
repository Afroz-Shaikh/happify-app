import 'package:happify_app/controller/login_controller.dart';
import 'package:happify_app/controller/question_controller.dart';
import 'package:happify_app/utilities/utilities.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(), tag: LoginController().toString());
    Get.put(QuestionsController(), tag: QuestionsController().toString());
  }
}
