import 'package:flutter/material.dart';

import './register_page.dart';
import './widget/heading_auth.dart';

class LoginScreen extends StatelessWidget {
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
          _textRegister(context),
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
          hintText: 'Senha',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: (){
          print('login...');
          Navigator.pushReplacementNamed(context, '/stores');
        },
        color: Theme.of(context).primaryColor,
        child: Text('LOGIN'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
      ),
    );
  }

  Widget _textRegister(context){
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/register');
        },
        child: Text('Cadastre-se', style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 18.2,
        )
        )
    );
  }
}
