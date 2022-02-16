import 'package:flutter/material.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/widgets/onBoardingViewBody.dart';

class onBoardingView extends StatelessWidget {
  const onBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: onBoaringViewBody(),
    );
  }
}
