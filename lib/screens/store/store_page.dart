import 'package:flutter/material.dart';

import '../../models/Store.dart';

import './widget/store_card.dart';
import '../../widgets/flutter_bottom_navigation.dart';

class StoresPage extends StatefulWidget {
  const StoresPage({Key? key}) : super(key: key);

  @override
  _StoresPageState createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {

  final List<Store> _stores = [
    Store(
      name: 'Trabalho Final',
      contact: 'contato@contato.com.br',
      image: '',
      uuid: '1',
    ),
    Store(
      name: 'Loja de Du',
      contact: 'eduardodiniz@contato.com.br',
      image: '',
      uuid: '2',
    ),
    Store(
      name: 'Loja de Japa',
      contact: 'japa@contato.com.br',
      image: '',
      uuid: '3',
    ),
    Store(
      name: 'Loja de Ana',
      contact: 'ana@contato.com.br',
      image: '',
      uuid: '4',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Lojas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _buildStores(context),
      bottomNavigationBar: FlutterStoreBottomNavigator(0),
    );
  }

  Widget _buildStores(context) {
    return Container(
      child: ListView.builder(
        itemCount: _stores.length,
        itemBuilder: (context, index){
          final Store store = _stores[index];
          return StoreCard(
              uuid: store.uuid,
              name: store.name,
              image: store.image,
              contact: store.contact
          );
        },
      ),
    );
  }

}

