import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:viplive/core/home_page/productDataModel.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Les Articles',
      home: articles(),
    );
  }
}

class articles extends StatefulWidget {
  const articles({Key? key}) : super(key: key);

  @override
  _articlesState createState() => _articlesState();
}

class _articlesState extends State<articles> {
  TextEditingController? _textEditingController = TextEditingController();
  List _items = [];
  List _foundItems = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/BDD.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["products"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    readJson();
    setState(() {
      _foundItems = _items;
    });
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _items;
    } else {
      results = _items
          .where((items) => items['Designation']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Les Articles"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  _runFilter(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  hintText: 'code bar ou nom',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: _foundItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundItems.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                Container(
                                    height: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Code bar : ",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              _foundItems[index]["Code"],
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Designation : ",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Flexible(
                                              child: Text(
                                                _foundItems[index]
                                                    ["Designation"],
                                                style: TextStyle(fontSize: 16),
                                                maxLines: 3,
                                                softWrap: true,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Famille : ",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Flexible(
                                              child: Text(
                                                _foundItems[index]["Famile"],
                                                style: TextStyle(fontSize: 16),
                                                maxLines: 3,
                                                softWrap: true,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(children: [
                                          Text(
                                            "Price de HT : ",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            _foundItems[index]["PriceHT"]
                                                    .toString() +
                                                " دج",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ]),
                                        Row(children: [
                                          Text(
                                            "Price de VT : ",
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            _foundItems[index]["PriceVT"]
                                                    .toString() +
                                                " دج",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ]),
                                        Row(children: [
                                          Text(
                                            "Stock : ",
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            _foundItems[index]["Stock"]
                                                .toString(),
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ]),
                                      ],
                                    )),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Container(
                        child: Text("NOTHING IS FOUND"),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
