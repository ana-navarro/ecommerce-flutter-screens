import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/flutter_bottom_navigation.dart';
import '../../models/Order.dart';
import '../../models/Product.dart';
import '../../widgets/product_card.dart';
import '../../models/Evaluation.dart';

class OrderDetailScreen extends StatelessWidget {
  Order _order = Order(
    identify: '125893',
    date: '30/01/2021',
    status: 'open',
    total: '90.00',
    products: [
      Product(
          identify: '1',
          title: 'Gabinete Gamer Husky',
          description: 'Gabinete Gamer Husky',
          price: '450.50',
          image: ''),
      Product(
          identify: '2',
          title: 'Gabinete Gamer Husky',
          description: 'Gabinete Gamer Husky',
          price: '450.50',
          image: '')
    ],
    evaluation: [],
    //evaluation: [Evaluation(nameUser: 'Ana', comment: 'Excelente', stars: 5)],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Pedido'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(child: _buildOrderDetails(context)),
      bottomNavigationBar: FlutterStoreBottomNavigator(1),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _makeTextOrder('Numero', _order.identify),
          _makeTextOrder('Data', _order.date),
          _makeTextOrder('Status', _order.status),
          _makeTextOrder('Total em R\$', _order.total),
          Container(height: 30),
          Text(
            'Produtos',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          _buildProductsOrder(context),
          Container(height: 30),
          Text(
            'Avaliações: ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          _buildEvaluationsOrder(context),
        ],
      ),
    );
  }

  Widget _makeTextOrder(String textLabel, String textValue) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Text(
            textLabel + ': ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            textValue,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsOrder(context) {
    return Container(
      height: 250,
      child: ListView.builder(
          itemCount: _order.products.length,
          itemBuilder: (context, index) {
            final Product product = _order.products[index];
            return ProductCard(
              identify: product.identify,
              description: product.description,
              image: product.image,
              price: product.price,
              title: product.title,
              notShowIconCart: true,
            );
          }),
    );
  }

  Widget _buildEvaluationsOrder(context) {
    return _order.evaluation.length > 0 ? Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: SingleChildScrollView(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _order.evaluation.length,
            itemBuilder: (context, index) {
              final Evaluation evaluation = _order.evaluation[index];
              return _buildEvaluationItem(evaluation, context);
            },
          ),
        )): Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 30, top: 10),
      child: RaisedButton(
        child: Text('Avaliar o Pedido'),
        onPressed: () {
          Navigator.pushNamed(context, '/evaluation-order', );
        },
        color: Colors.orange,
        elevation: 2.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: Colors.orangeAccent)
        ),
      ),
    );
  }

  Widget _buildEvaluationItem(Evaluation evaluation, context) {
    return Card(
        elevation: 2.5,
        child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${evaluation.nameUser} ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                RatingBarIndicator(
                  rating: evaluation.stars,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                ), Container(height: 12,),
                Text(
                  evaluation.comment, style: TextStyle(fontSize: 16),
                ),
              ],
            )));
  }
}
