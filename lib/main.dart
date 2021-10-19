import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:happify_app/utilities/route_utilities.dart';
import 'package:happify_app/utilities/variable_utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init("Happify");
  VariableUtilities.prefs = GetStorage("Happify");
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happify',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          RouteUtilities.root, // default route (first page) of application.
      getPages: RouteUtilities
          .getPages(), // list of all the available pages of the application.
    );
  }
}
