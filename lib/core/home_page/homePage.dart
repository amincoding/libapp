import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viplive/core/home_page/articles.dart';
import 'package:viplive/core/home_page/barCode.dart';
import 'package:viplive/core/home_page/home.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/theme_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyStatfullWidget();
  }
}

class MyStatfullWidget extends StatefulWidget {
  const MyStatfullWidget({Key? key}) : super(key: key);

  @override
  _MyStatfullWidgetState createState() => _MyStatfullWidgetState();
}

class _MyStatfullWidgetState extends State<MyStatfullWidget> {
  int _selectedIndex = 0;

  static const homee = CupertinoIcons.home;
  static const barcode = CupertinoIcons.barcode;
  static const listItems = CupertinoIcons.list_dash;
  Color _getColor() {
    if (ThemeService().getThemeMode() == ThemeMode.dark) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Les articles',
    ),
    Text(
      'Index 2: Qr code',
    ),
  ];

  PageController _pageController = PageController();
  List<Widget> _screen = [
    home(),
    articles(),
    qrCode(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _screen,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          animationDuration: Duration(milliseconds: 150),
          items: [
            BottomNavyBarItem(
              icon: Icon(homee),
              activeColor: Colors.teal,
              inactiveColor: Colors.amber.shade800,
              title: Text("Home"),
            ),
            BottomNavyBarItem(
              icon: Icon(listItems),
              activeColor: Colors.teal,
              inactiveColor: Colors.amber.shade800,
              title: Text("bar code"),
            ),
            BottomNavyBarItem(
              icon: Icon(barcode),
              activeColor: Colors.teal,
              inactiveColor: Colors.amber.shade800,
              title: Text("articles"),
            ),
          ],
          onItemSelected: (value) {
            setState(() {
              _onItemTapped(value);
              _pageController.animateToPage(value,
                  duration: Duration(microseconds: 300), curve: Curves.ease);
            });
          },
        ),
      ),
    );
  }
}
