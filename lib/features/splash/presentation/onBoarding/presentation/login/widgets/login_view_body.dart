import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viplive/core/constants.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/core/widgets/custom_buttons.dart';
import 'package:viplive/core/widgets/space_widget.dart';
import 'package:viplive/screens/signUpEmail.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(10),
        SizedBox(
          child: Image.asset(kLogo),
          height: SizeConfig.defaultSize! * 40,
        ),
        Expanded(child: SizedBox()),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButtonWithIcon(
                  color: Color(0xFFdb3236),
                  iconData: FontAwesomeIcons.google,
                  text: 'GOOGLE',
                  onTap: () {
                    // Get.to(() => CompleteInformationView(),
                    //     duration: Duration(milliseconds: 500),
                    //     transition: Transition.rightToLeft);
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButtonWithIcon(
                  onTap: () {
                    Navigator.popAndPushNamed(context, "4");
                  },
                  color: Color(0xFF4267B2),
                  iconData: Icons.email,
                  text: 'EMAIL',
                ),
              ),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
