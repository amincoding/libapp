import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/constants.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/drawer_screens/settings_details/darkthemePreferences.dart';
import 'drawer_screens/settings_details/themeData.dart';
import 'features/splash/presentation/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool darktheme = false;

Future<void> main() async {
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
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) {
      return GetMaterialApp(
        theme: Styles.themeData(themeChangeProvider.darkTheme, context),
        debugShowCheckedModeBanner: false,
        home: splashView(),
      );
    }));
  }
}
