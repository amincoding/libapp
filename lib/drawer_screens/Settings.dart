import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/core/widgets/custom_buttons.dart';
import 'package:viplive/main.dart';


class settingsScreen extends StatefulWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
    );
  }
}
