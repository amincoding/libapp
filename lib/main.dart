import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:viplive/core/constants.dart';
import 'features/splash/presentation/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BelbaliLibrary());
}

class BelbaliLibrary extends StatelessWidget {
  const BelbaliLibrary({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: KFont),
      debugShowCheckedModeBanner: false,
      home: splashView(),
    );
  }
}

// start with scholar tech then after finishing 
// u can actually go back on fixing the rest of the problems
