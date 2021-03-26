import 'package:flutter/material.dart';
import 'package:my_stock/src/configs/app_route.dart';
import 'package:my_stock/src/constants/app_setting.dart';
import 'package:my_stock/src/pages/home/home_page.dart';
import 'package:my_stock/src/pages/login/login_page.dart';
import 'package:my_stock/src/pages/map/google_map_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoute().getAll,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              color: Colors.white,
            );
          }
          final token = snapshot.data.getString(AppSetting.tokenSetting) ?? '';
          if(token.isNotEmpty){
            return HomePage();
          }
          return LoginPage();
        },
      ),
    );
  }
}
