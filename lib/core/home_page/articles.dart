import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:viplive/core/utils/sizeConfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  List _items = [];

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Les Articles',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // ElevatedButton(
            //   child: const Text('Load Data'),
            //   onPressed: readJson,
            // ),

            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Container(
                                  height: SizeConfig.screenHeight! * 0.3,
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
                                            _items[index]["Code"],
                                            style: TextStyle(
                                              color: Colors.black,
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
                                              _items[index]["Designation"],
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
                                              _items[index]["Famile"],
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
                                          _items[index]["PriceHT"].toString() +
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
                                          _items[index]["PriceVT"].toString() +
                                              ".00 دج",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ]),
                                    ],
                                  )),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.01,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
