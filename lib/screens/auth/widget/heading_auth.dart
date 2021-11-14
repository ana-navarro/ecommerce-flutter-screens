import 'package:flutter/material.dart';

class HeadingAuth extends StatelessWidget {
  const HeadingAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      width: 130.0,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/IconeFlutterFood.png'),
              fit: BoxFit.fill)),
    );
  }
}
