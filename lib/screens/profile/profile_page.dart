import 'package:flutter/material.dart';
import '../../widgets/flutter_bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Meu Perfil'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      bottomNavigationBar: FlutterStoreBottomNavigator(3),
      body: Center(child: _buildProfileScreen(context)),
    );
  }

  Widget _buildProfileScreen(context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('NOME do Usuário', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
          Container(height: 10),
          Text('email@email.com', style: TextStyle(color: Colors.black),),
          Container(height: 10),
          Container(
            child: RaisedButton(
              onPressed: (){
                print('Logout');
              },
              child: Text('Sair'),
              elevation: 2.2,
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
