import 'package:flutter/material.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/complete_information/widgets/complete_information_body.dart';

class CompleteInformationView extends StatelessWidget {
  const CompleteInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteInformationBody(),
    );
  }
}
