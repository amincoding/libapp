import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/onBoardingView.dart';

class stopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> snapshot) {
        //if the snapshot is null, or not has data it is signed out
        if (!snapshot.hasData) return onBoardingView();
        // if the snapshot is having data it is signed in, show the homescreen
        return HomePage();
      },
    );
  }
}
