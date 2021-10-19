import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// all the variables of the global use.
class VariableUtilities {
  static GetStorage? prefs;
  static Size? screenSize;
  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
}
