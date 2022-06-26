import 'package:flutter/material.dart';
import 'package:viplive/core/widgets/custom_buttons.dart';
import 'package:viplive/core/widgets/space_widget.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/complete_information/widgets/complete_information_body.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          Column(
            children: [
              VerticalSpace(10),
              VerticalSpace(2),
              Text("Enter your name"),
              VerticalSpace(2),
              Text("Enter your name"),
              VerticalSpace(5),
              CustomGeneralButton(
                text: 'Login',
              )
            ],
          ),
        ]),
      ),
    );
  }
}
