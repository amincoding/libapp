// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/onBoardingView.dart';

class splashViewBody extends StatefulWidget {
  const splashViewBody({Key? key}) : super(key: key);

  @override
  State<splashViewBody> createState() => _splashViewBodyState();
}

class _splashViewBodyState extends State<splashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: fadingAnimation!,
            child: Image.asset("assets/splash_view.png"),
          ),
        ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 4), () {
      Get.to(() => onBoardingView(), transition: Transition.fadeIn);
    });
  }
}
