import 'dart:convert';

class Product {
  String identify;
  String title;
  String description;
  String image;
  String price;

  Product({
    required this.identify,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(jsonData) {
    return Product(
      identify: jsonData['identify'],
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: jsonData['price'],
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    });
  }
}