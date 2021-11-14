import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_buscape/models/Product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String identify;
  String title;
  String description;
  String price;
  String image;
  bool notShowIconCart;

  ProductCard({required this.identify, required this.title, required this.description, required this.price, required this.image, required this.notShowIconCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.5,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                _buildImage(),
                _buildInfoProduct(),
                notShowIconCart ? Container() : _buildButtonCart(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: image != ''
              ? image: 'https://i.pinimg.com/originals/0d/ed/76/0ded765283f158b5d59ba57e081eab36.png',
          placeholder: (context, url) => Container(
            height: 80,
            width: 80,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoProduct() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 7,
          ),
          Text(
            description,
            style: const TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          Container(
            height: 7,
          ),
          Text(
            'R\$ $price',
            style: const TextStyle(
                color: Colors.black38, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonCart(context) {
    return notShowIconCart ? Container() : Container(
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }


}
