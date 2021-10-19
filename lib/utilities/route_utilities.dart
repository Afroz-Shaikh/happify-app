import 'package:get/get.dart';
import 'package:happify_app/utilities/bindings.dart';
import 'package:happify_app/view/screens/auth/login_screen.dart';
import 'package:happify_app/view/screens/completed/completed_screen.dart';
import 'package:happify_app/view/screens/home/about_screen.dart';
import 'package:happify_app/view/screens/home/home_screen.dart';
import 'package:happify_app/view/screens/home/profile_screen.dart';
import 'package:happify_app/view/screens/home/status_screen.dart';
import 'package:happify_app/view/screens/pageview/pageview_screen.dart';
import 'package:happify_app/view/screens/splash/splash_screen.dart';

class RouteUtilities {
  static const String root = "/";
  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';
  static const String statusScreen = '/statusScreen';
  static const String profileScreen = '/profileScreen';
  static const String pageviewScreen = '/pageviewScreen';
  static const String stepviewScreen = '/stepviewScreen';
  static const String completedScreen = '/completedScreen';
  static const String loginScreen = '/loginScreen';
  static const String aboutScreen = '/aboutScreen';

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: root,
        page: () => SplashScreen(),
        binding: Bind(),
      ),
      GetPage(
        name: splashScreen,
        page: () => SplashScreen(),
        binding: Bind(),
      ),
      GetPage(
        name: loginScreen,
        page: () => LoginScreen(),
        binding: Bind(),
      ),
      GetPage(
        name: homeScreen,
        page: () => HomeScreen(),
        binding: Bind(),
      ),
      GetPage(
        name: statusScreen,
        page: () => StatusScreen(),
        binding: Bind(),
      ),
      GetPage(
        name: profileScreen,
        page: () => ProfileScreen(),
        binding: Bind(),
      ),
      GetPage(
        name: pageviewScreen,
        page: () => PageviewScreen(),
        binding: Bind(),
      ),
      GetPage(
        name: completedScreen,
        page: () => CompleteScreen(),
        binding: Bind(),
      ),
      GetPage(
        name: aboutScreen,
        page: () => AboutScreen(),
        binding: Bind(),
      ),
    ];
  }
}
