import 'package:flutter/material.dart';
import '../../widgets/flutter_bottom_navigation.dart';
import '../../widgets/show_image_cart_network.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(child: _buildContentCart(context)),
      bottomNavigationBar: FlutterStoreBottomNavigator(2),
    );
  }

  Widget _buildContentCart(context) {
    return Column(
      children: [
        _buildHeader(),
        _buildCartList(context),
        _buildTextTotalCart(),
        _bottonCheckou(context),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(16),
      child: Text('Total (10) de items', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildCartList(context) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: (context, index) => _buildCartItem(context),
    );
  }

  Widget _buildCartItem(context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ShowImageCartNetwork(
                  'https://i.pinimg.com/originals/0d/ed/76/0ded765283f158b5d59ba57e081eab36.png'),
              _showDetailItemCart(context),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 24,
          width: 24,
          margin: EdgeInsets.only(top:2,right: 6),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: Icon(Icons.close, size: 20, color: Colors.white,),
        ),
      ),
    ]);
  }

  Widget _showDetailItemCart(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 4, right: 4, left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gabinete Pichau Kazan',
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).primaryColor),
              maxLines: 2,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('R\$450.50', style: TextStyle(color: Colors.green)),
                  Container(height: 6),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove,
                          size: 24,
                          color: Colors.grey.shade700,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.add,
                          size: 24,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextTotalCart(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 26, bottom: 16),
      child: Text("Preço total: R\$ 4.505", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
    );
  }

  Widget _bottonCheckou(context){
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 50,right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.deepOrange,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 2.0),
            blurRadius: 10,
          )
        ],
      ),
      child: RaisedButton(
        onPressed: () {
          print('checkout');
        },
        child: Text('Finalizar Pedido'),
        color: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
