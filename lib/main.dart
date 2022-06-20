import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/constants.dart';
import 'package:viplive/core/home_page/home.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/drawer_screens/Settings.dart';
import 'package:viplive/drawer_screens/about_us_screen.dart';
import 'package:viplive/drawer_screens/feedback.dart';
import 'package:viplive/drawer_screens/follow_us_screen.dart';
import 'package:viplive/drawer_screens/profile.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/login/login_view.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/onBoardingView.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/widgets/stop_screen.dart';
import 'package:viplive/screens/signUpEmail.dart';
import 'package:viplive/screens/signin_email.dart';
import 'package:viplive/screens/thankyou_screen.dart';
import 'package:viplive/theme_services.dart';
import 'features/splash/presentation/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool darktheme = false;

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BelbaliLibrary());
}

class BelbaliLibrary extends StatefulWidget {
  const BelbaliLibrary({Key? key}) : super(key: key);

  @override
  State<BelbaliLibrary> createState() => _BelbaliLibraryState();
}

class _BelbaliLibraryState extends State<BelbaliLibrary> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "0",
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      debugShowCheckedModeBanner: false,
      routes: {
        "0": (context) => splashView(),
        "1": (context) => onBoardingView(),
        "2": (context) => stopScreen(),
        "3": (context) => LoginView(),
        "4": (context) => signUpEmail(),
        "5": (context) => signin_email(),
        "6": (context) => home(),
        "7": (context) => followUsScreen(),
        "8": (context) => aboutUsScreen(),
        "9": (context) => thankyou_screen(),
        "10": (context) => HomePage(),
        "11": (context) => settingsScreen(),
        "12": (context) => feedbackScreen(),
        "13": (context) => profileScreen(),
      },
    );
  }
}
