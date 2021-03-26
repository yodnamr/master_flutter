import 'package:flutter/material.dart';
import 'package:my_stock/src/configs/app_route.dart';

class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function (BuildContext context) onTap;

  const Menu({
    this.title,
    this.icon,
    this.iconColor = Colors.grey,
    this.onTap,
  });
}

class MenuViewModel {
  MenuViewModel();

  List<Menu> get items => <Menu>[
    Menu(
      title: 'Profile',
      icon: Icons.person,
      onTap: (context) {
        //todo
      },
      iconColor: Colors.blue,
    ),
    Menu(
      title: 'Map',
      icon: Icons.map,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.mapRoute);
      },
      iconColor: Colors.orange,
    ),
    Menu(
      title: 'Dashboard',
      icon: Icons.dashboard,
      onTap: (context) {
        //todo
      },
      iconColor: Colors.green,
    ),
    Menu(
      title: 'Timeline',
      icon: Icons.timeline,
      onTap: (context) {
        //todo
      },
      iconColor: Colors.purple,
    ),
    Menu(
      title: 'Settings',
      icon: Icons.settings,
      onTap: (context) {
        //todo
      },
      iconColor: Colors.cyan
    ),
  ];
}