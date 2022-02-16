import 'package:flutter/material.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/widgets/page_view_item.dart';

class customPageView extends StatelessWidget {
  const customPageView({Key? key, @required this.pageController})
      : super(key: key);
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(controller: pageController, children: [
      pageViewItem(
        imagePath: 'assets/enboarding2.png',
        title: 'Stationery',
        subTitle: 'shop from any were in algeria',
      ),
      pageViewItem(
        imagePath: 'assets/enboarding1.png',
        title: 'Office Supplies',
        subTitle: 'every thing is on your finger tips',
      ),
      pageViewItem(
        imagePath: 'assets/Belbali_logo.png',
        title: 'Join us',
        subTitle: 'Welcome to Belbali\'s library',
      )
    ]
        // pageViewItem(),
        // pageViewItem(),
        );
  }
}
