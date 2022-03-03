import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:viplive/core/constants.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/core/widgets/custom_buttons.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/login/login_view.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/widgets/custom_indicator.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/widgets/custom_page_view.dart';

class onBoaringViewBody extends StatefulWidget {
  const onBoaringViewBody({Key? key}) : super(key: key);

  @override
  State<onBoaringViewBody> createState() => _onBoaringViewBodyState();
}

class _onBoaringViewBodyState extends State<onBoaringViewBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          customPageView(
            pageController: pageController,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.10,
            left: 0,
            right: 0,
            child: customIndecator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            ),
          ),
          Visibility(
            visible:
                (pageController!.hasClients ? pageController?.page : 0) == 2
                    ? false
                    : true,
            child: Positioned(
              top: SizeConfig.screenHeight! * .08,
              right: SizeConfig.screenWidth! * .15,
              child: InkWell(
                onTap: () => Navigator.popAndPushNamed(context, "3"),
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    fontFamily: KFont,
                    fontSize: 14,
                    color: const Color(0xFF898989),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.screenHeight! * 0.1,
            left: SizeConfig.screenWidth! * 0.1,
            right: SizeConfig.screenHeight! * 0.05,
            child: CustomGeneralButton(
              text: (pageController!.hasClients ? pageController?.page : 0)! < 2
                  ? "NEXT"
                  : "GET STARTED",
              onTap: () {
                if (pageController!.page! < 2) {
                  pageController?.nextPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  Navigator.popAndPushNamed(context, "3");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
