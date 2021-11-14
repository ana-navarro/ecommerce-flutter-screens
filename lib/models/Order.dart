import 'dart:convert';

import './Product.dart';
import './Evaluation.dart';

class Order {
  String identify;
  String date;
  String status;
  String total;
  List<Product> products;
  List<Evaluation> evaluation;

  Order(
      {required this.identify,
      required this.date,
      required this.status,
      required this.total,
      required this.products,
      required this.evaluation});

  factory Order.fromJson(jsonData) {
    return Order(
        identify: jsonData['identify'],
        date: jsonData['date'],
        status: jsonData['status'],
        total: jsonData["total"],
        products: jsonData['products'],
        evaluation: jsonData['evaluation'],
    );
  }
  toJson() {
    return jsonEncode({
      'identify': identify,
      'date': date,
      'status': status,
      'total': total,
      'products': products,
      'evaluation': evaluation,
    });
  }

}