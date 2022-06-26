import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:viplive/core/home_page/productDataModel.dart';

List<Product> parseProduct(String resposeBody) {
  var list = json.decode(resposeBody) as List<dynamic>;
  var products = list.map((model) => Product.fromJson(model)).toList();
  return products;
}

Future<List<Product>> fetchProduct() async {
  final String response = await rootBundle.loadString("assets/ig.json");
  final data = await json.decode(response);
  return data;
}
