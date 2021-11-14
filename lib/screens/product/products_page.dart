import 'package:flutter/material.dart';

import '../../models/Category.dart';
import '../../models/Product.dart';
import '../product/widgets/categories.dart';

import '../../widgets/product_card.dart';
import '../../widgets/flutter_bottom_navigation.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  List<Category> _categories = [
    Category(
        identify: '1',
        name: 'Processador',
        description: 'Processador para Desktop'),
    Category(
        identify: '2',
        name: 'Placa de Vídeo',
        description: 'Placa de Vídeo'),
    Category(
        identify: '3',
        name: 'Monitor',
        description: 'Monitor'),
    Category(
        identify: '4',
        name: 'Teclado',
        description: 'Teclado'),
    Category(
        identify: '5',
        name: 'Gabinete',
        description: 'Gabinete'),
  ];

  final List<Product> _product = [
    Product(
        identify: '1',
        title: 'Gabinete Gamer Husky',
        description: 'Gabinete Gamer Husky',
        price: '450.50',
        image: ''),
    Product(
        identify: '2',
        title: 'Monitor AOC',
        description: 'Monitor AOC',
        price: '1550.50',
        image: '',
    ),
    Product(
        identify: '3',
        title: 'Teclado Redragon',
        description: 'Teclado Redragon',
        price: '250.50',
        image: ''),
    Product(
        identify: '4',
        title: 'Placa de Vídeo EVGA RTX 2060',
        description: 'RTX 2060',
        price: '4550.50',
        image: ''),
    Product(
        identify: '5',
        title: 'Processador Intel i9',
        description: 'Processador intel',
        price: '3550.50',
        image: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Loja nome'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildProducts(),
      bottomNavigationBar: FlutterStoreBottomNavigator(0),
    );
  }

  Widget _buildScreen(){
    return Column(
      children: [
        Categories(_categories)
      ],
    );
  }

  Widget _buildProducts(){
    return Container(
      height: (MediaQuery.of(context).size.height)-180,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: _product.length,
        itemBuilder: (context, index) {
          final Product product = _product[index];

          return ProductCard(
              identify: product.identify,
              title: product.title,
              description: product.description,
              image: product.image,
              price: product.price,
              notShowIconCart: false,
          );
        },
      ),
    );
  }
}
