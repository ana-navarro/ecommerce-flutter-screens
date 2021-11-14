import 'package:flutter/material.dart';

import './login_page.dart';
import './widget/heading_auth.dart';

class RegisterScreen extends StatelessWidget {
  double _deviceWidth = 0;
  double _deviceHeight = 0;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: _loginPageUI(context),
        )
    );
  }

  Widget _loginPageUI(context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
      child: Column(
        children: [
          Container(height: 50.0),
          const HeadingAuth(),
          Container(height: 20.0),
          _formLogin(context),
          Container(height: 15.0),
          _loginButton(context),
          Container(height: 30.0),
          _textLogin(context),
        ],
      ),
    );
  }

  Widget _formLogin(context){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(143, 148, 251, 1.6),
                blurRadius: 20.0,
                offset: Offset(0, 10)
            )
          ]
      ),
      child: Column(
        children: [
          _nameTextField(context),
          _emailTextField(context),
          _passwordTextField(context),
        ],
      ),
    );
  }
  Widget _emailTextField(context) {
    return TextFormField(
      //controller: _email,
      autocorrect: false,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          contentPadding: const EdgeInsets.all(20.0),
          hintText: 'E-mail',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _passwordTextField(context) {
    return TextFormField(
      //controller: _passowrd,
      autocorrect: false,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(20.0),
          hintText: 'Passowrd',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _nameTextField(context) {
    return TextFormField(
      //controller: _passowrd,
      autocorrect: false,
      autofocus: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          contentPadding: const EdgeInsets.all(20.0),
          hintText: 'Nome',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: (){
          print('register...');
          Navigator.pushReplacementNamed(context, '/restaurantes');
        },
        color: Theme.of(context).primaryColor,
        child: Text('CADASTRAR'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
      ),
    );
  }

  Widget _textLogin(context){
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        child: Text('Já tem cadastro? Faça Login', style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 18.2,
        )
        )
    );
  }
}
