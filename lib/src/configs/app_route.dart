

import 'package:flutter/material.dart';
import 'package:my_stock/src/pages/home/home_page.dart';
import 'package:my_stock/src/pages/login/login_page.dart';

class AppRoute {
  static const homeRoute = "home";
  static const loginRoute = "login";

  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    loginRoute: (context) => LoginPage(),
  };

  get getAll => _route;
}