import 'package:flutter/material.dart';
import 'package:viplive/core/constants.dart';
import 'package:viplive/features/splash/presentation/widgets/splash_view_body.dart';

class splashView extends StatelessWidget {
  const splashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackGroundColor,
      body: splashViewBody(),
    );
  }
}
