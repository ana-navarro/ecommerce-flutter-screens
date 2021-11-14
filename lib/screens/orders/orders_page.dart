import 'package:flutter/material.dart';
import '../../widgets/flutter_bottom_navigation.dart';
import '../../models/Order.dart';

class OrdersScreen extends StatelessWidget {

  final _orders = [
    Order(identify: '1', date: '30-01-2021', status: 'Entregue', total: '', products: [], evaluation: []),
    Order(identify: '2', date: '30-01-2021', status: 'Entregue', total: '', products: [], evaluation: []),
    Order(identify: '3', date: '30-01-2021', status: 'Entregue', total: '', products: [], evaluation: []),
    Order(identify: '4', date: '30-01-2021', status: 'Entregue', total: '', products: [], evaluation: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meus Pedidos'), centerTitle: true, backgroundColor: Theme.of(context).primaryColor,),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildOrderScreen(context),
      bottomNavigationBar: FlutterStoreBottomNavigator(1),
    );
  }

  Widget _buildOrderScreen(context){
    return Column(
      children: [
        _buildHeader(),
        _builOrderList(context),
      ],
    );
  }

  Widget _buildHeader(){
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: Text('Meus Pedidos', style: TextStyle(fontSize: 16, color: Colors.black),),
    );
  }

  Widget _builOrderList(context){
    return Expanded(
      child: ListView.builder(itemCount: _orders.length,itemBuilder: (context, index) {
        final Order order = _orders[index];
        return _buildItemOrder(order, context);
      }),
    );
  }

  Widget _buildItemOrder(Order order, context) {
    return ListTile(
      title: Text(
        "Pedido #${order.identify}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      subtitle: Text(
        "${order.date}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      trailing: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.navigate_next),
      ),
      onTap: () {
        print(order.identify);
        Navigator.pushNamed(context, '/order-details', arguments: order.identify);
      },
    );
  }
}
