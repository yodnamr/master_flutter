import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              //https://uigradients.com/
              gradient: LinearGradient(
                colors: [
                  Color(0XFF36D1DC),
                  Color(0xFF5B86E5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0]
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Header'),
              Text('login'),
              Text('login button'),
              Text('forgot password'),
              Text('sso'),
            ],
          ),
        ],
      ),
    );
  }
}
