import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happify_app/model/user_data_model/user_data_model.dart';
import 'package:happify_app/utilities/utilities.dart';

class LoginController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  String _userName = "";
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    update();
  }

  String _email = "";
  String get email => _email;
  set email(String value) {
    _email = value;
    update();
  }

  String _profileImageUrl =
      "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png";
  String get profileImageUrl => _profileImageUrl;
  set profileImageUrl(String value) {
    _profileImageUrl = value;
    update();
  }

  Future<bool?> login({required AuthCredential? token}) async {
    this.isLoading = true;
    try {
      if (token != null) {
        UserCredential value =
            await FirebaseAuth.instance.signInWithCredential(token);

        DocumentSnapshot data = await FirebaseFirestore.instance
            .collection("User")
            .doc(value.user?.uid)
            .get();

        print(value.user?.uid);

        VariableUtilities.prefs?.write("UserId", value.user?.uid);
        print("ST : ${VariableUtilities.prefs?.read("UserId")}");
        if (!data.exists) {
          this.isLoading = false;

          return FirebaseFirestore.instance
              .collection("User")
              .doc(value.user?.uid)
              .set(UserDataModel(
                      email: this.email,
                      profileImageUrl: this.profileImageUrl,
                      userName: this.userName)
                  .toMap())
              .then((value) => true)
              .catchError((_) => false);
        }
        this.isLoading = false;

        return null;
      } else {
        this.isLoading = false;

        return false;
      }
    } catch (e) {
      print(e);
      this.isLoading = false;
      return false;
    }
  }

  Future<bool> logout() async {
    this.isLoading = true;
    return FirebaseAuth.instance.signOut().then((value) {
      VariableUtilities.prefs?.write("UserId", null);
      this.isLoading = false;

      return true;
    });
  }
}
