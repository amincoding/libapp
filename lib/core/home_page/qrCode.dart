import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/drawer.dart';

String _productCode = 'Unknown';
String _productName = 'Unknown';
String _productPriceHT = 'Unknown';
String _productPriceVT = 'Unknown';
String _productFamille = 'Unknown';
String _productQuantity = 'Unknown';

bool found = false;

class qrCode extends StatefulWidget {
  @override
  _qrCodeState createState() => _qrCodeState();
}

class _qrCodeState extends State<qrCode> {
  int temp = 0;
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    temp = 0;
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    while (_items[temp]["Code"] != barcodeScanRes) {
      temp++;
      found = true;
      if (temp > _items.length) {
        found = false;
        break;
      }
    }

    setState(() {
      _productCode = _items[temp]["Code"].toString();
      _productName = _items[temp]["Designation"].toString();
      _productPriceHT = _items[temp]["PriceHT"].toString();
      _productPriceVT = _items[temp]["PriceVT"].toString();
      _productFamille = _items[temp]["Famile"].toString();
      _productQuantity = _items[temp]["Stock"].toString();
      ;
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
    return SafeArea(
        child: Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              title: const Text('Barcode scan'),
              centerTitle: true,
            ),
            body: Builder(builder: (BuildContext context) {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5),
                child: Stack(
                  children: [
                    _items.isNotEmpty
                        ? ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(children: [
                                Container(
                                  child: test(found),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 50),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        scanBarcodeNormal();
                                      },
                                      child: Text('Start barcode scan')),
                                ),
                              ]);
                            })
                        : Container(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 30,
                    ),
                  ],
                ),
              );
            })));
  }
}

test(bool found) {
  if (found == true) {
    return show();
  } else {
    return notShow();
  }
}

notShow() {
  return Container(
    height: SizeConfig.screenHeight! * 0.7,
    child: Center(child: Text("No item was found")),
  );
}

show() {
  return Column(
    children: [
      Container(
        height: 100,
        color: Colors.green[50],
        child: Row(
          children: [
            Text(
              "Code de bar :     ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Flexible(
              child: Text(
                _productCode,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 100,
        color: Colors.yellow[50],
        child: Row(
          children: [
            Text(
              "Désignation :     ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Flexible(
              child: Text(
                _productName,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
      Container(
          height: 100,
          color: Colors.green[50],
          child: Row(
            children: [
              Text(
                "Prix de HT:     ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                _productPriceHT + (" دج"),
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
            ],
          )),
      Container(
          height: 100,
          color: Colors.yellow[50],
          child: Row(
            children: [
              Text(
                "Prix de VT :     ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                _productPriceVT + ".00 دج",
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
            ],
          )),
      Container(
          height: 100,
          color: Colors.green[50],
          child: Row(
            children: [
              Text(
                "Famile :     ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                _productFamille,
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
            ],
          )),
      Container(
          height: 100,
          color: Colors.yellow[50],
          child: Row(
            children: [
              Text(
                "Stock :     ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                _productQuantity,
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
            ],
          )),
    ],
  );
}
