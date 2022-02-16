import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:viplive/core/utils/sizeConfig.dart';

void main() => runApp(qrCode());

class qrCode extends StatefulWidget {
  @override
  _qrCodeState createState() => _qrCodeState();
}

class _qrCodeState extends State<qrCode> {
  String _scanBarcode = 'Unknown';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/BDD.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["products"];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    _items.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          scanBarcodeNormal();

                                          if (_scanBarcode ==
                                              _items[index]["Code"]) {
                                            Text(_items[index]["Designation"]);
                                          }
                                        },
                                        child: Text('Start barcode scan')),
                                  ]);
                                }))
                        : Container(),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                  ],
                ),
              );
            })));
  }
}
