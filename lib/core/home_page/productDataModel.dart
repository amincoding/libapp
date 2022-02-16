import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.products,
  });

  List<Product> products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.code,
    required this.designation,
    required this.price,
    required this.famile,
  });

  String code;
  String designation;
  String price;
  String famile;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        code: json["Code"],
        designation: json["Designation"] == null ? null : json["Designation"],
        price: json["Price"] == null ? null : json["Price"],
        famile: json["Famile"] == null ? null : json["Famile"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Designation": designation == null ? null : designation,
        "Price": price == null ? null : price,
        "Famile": famile == null ? null : famile,
      };
}
