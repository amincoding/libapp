import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/drawer.dart';
import 'package:viplive/screens/signUpEmail.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/ig.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["posts"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Home"),
        centerTitle: true,
      ),
    );
  }
}
