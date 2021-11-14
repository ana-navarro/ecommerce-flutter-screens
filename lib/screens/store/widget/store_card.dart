import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


import '../../../models/Store.dart';

class StoreCard extends StatelessWidget {
  final String uuid;
  final String name;
  final String image;
  final String contact;

  const StoreCard({
    required this.uuid,
    required this.name,
    required this.image,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(name);
        Navigator.pushNamed(context, '/products');
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(1,4,1,1),
        child: Card(
          elevation: 2.5,
          child: Container(
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: image != ''
                              ? image: 'https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-store-icon-image_1128274.jpg',
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
                    ),
                    const VerticalDivider(color: Colors.black54),
                    Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Colors.black54, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
