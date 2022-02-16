import 'package:flutter/material.dart';
import 'package:viplive/core/constants.dart';
import 'package:viplive/core/home_page/articles.dart';
import 'package:viplive/core/home_page/home.dart';
import 'package:viplive/core/home_page/qrCode.dart';

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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Les articles',
      style: optionStyle,
    ),
    Text(
      'Index 2: Qr code',
      style: optionStyle,
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
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Les articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Qr code',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: KColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
