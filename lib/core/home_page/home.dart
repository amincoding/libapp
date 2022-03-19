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
          title: Text("Home"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Card(
                  margin: const EdgeInsets.all(5),
                  child: Container(
                    // color: _items[index]["position"] % 2 == 0
                    //     ? Colors.blueGrey[100]
                    //     : Colors.lightGreen[100],
                    child: Column(
                      children: [
                        Text("post number : " +
                            _items[index]["position"].toString()),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.01,
                        ),
                        Text(_items[index]["timestamp"]),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.01,
                        ),
                        // Image.network(_items[index]["displayUrl"]),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: (() async {
                              var url = _items[index]["url"].toString();
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                            child: Container(
                              child: Text(
                                _items[index]["caption"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
