import 'dart:convert';

class Store {
  String uuid;
  String name;
  String image;
  String contact;

  Store({required this.uuid, required this.name, required this.image, required this.contact});

  factory Store.fromJson(jsonData) {
    return Store(
      uuid: jsonData['uuid'],
      name: jsonData['name'],
      image: jsonData['image'],
      contact: jsonData['contact'],
    );
  }

  toJson() {
    return jsonEncode({
      'uuid': uuid,
      'name': name,
      'image': image,
      'contact': contact,
    });
  }
}