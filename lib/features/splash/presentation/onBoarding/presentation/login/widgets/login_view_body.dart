import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viplive/core/constants.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/core/widgets/custom_buttons.dart';
import 'package:viplive/core/widgets/space_widget.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/complete_information/complete_information_view.dart';
import 'package:viplive/screens/signUpEmail.dart';
import 'package:viplive/screens/signup.dart';

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
                  iconData: FontAwesomeIcons.googlePlusG,
                  text: 'GOOGLE',
                  onTap: () {
                    Get.to(() => CompleteInformationView(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.rightToLeft);
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
                    Get.to(() => signUpEmail(),
                        transition: Transition.rightToLeft);
                  },
                  color: Color(0xFF4267B2),
                  iconData: FontAwesomeIcons.facebookF,
                  text: 'EMAIL',
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButtonWithIcon(
                  onTap: () {
                    Get.to(() => HomePage(),
                        transition: Transition.rightToLeft);
                  },
                  color: Color(0xFF4267B2),
                  iconData: FontAwesomeIcons.dumbbell,
                  text: 'Test mode',
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