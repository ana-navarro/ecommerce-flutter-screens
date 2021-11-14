import 'package:flutter/material.dart';

import './screens/auth/login_page.dart';
import './screens/auth/register_page.dart';
import './screens/store/store_page.dart';
import './screens/product/products_page.dart';
import './screens/carts/cart_page.dart';
import './screens/orders/orders_page.dart';
import './screens/order_details/order_details.dart';
import './screens/evaluation_order/evaluation_order.dart';
import './screens/profile/profile_page.dart';

void main() {
  runApp(const FlutterProductApp());
}

class FlutterProductApp extends StatelessWidget {
  const FlutterProductApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterProduct',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(147, 70, 248, 1),
        accentColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
      ),
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/stores': (context) => const StoresPage(),
        '/products': (context) => const ProductScreen(),
        '/cart': (context) => const CartScreen(),
        '/my-orders': (context) => OrdersScreen(),
        '/order-details': (context) => OrderDetailScreen(),
        '/evaluation-order': (context) => EvaluationPage(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

