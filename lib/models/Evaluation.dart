import 'dart:convert';

import './Product.dart';
import './Evaluation.dart';

class Evaluation {
  String nameUser;
  String comment;
  double stars;

  Evaluation({required this.nameUser, required this.comment, required this.stars});

  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
      nameUser: jsonData['nameUser'],
      stars: jsonData['stars'],
      comment: jsonData['comment'],
    );
  }

  toJson() {
    return jsonEncode({
      'nameUser': nameUser,
      'comment': comment,
      'stars': stars,
    });
  }

}