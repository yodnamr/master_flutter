import 'package:flutter/material.dart';
import 'package:my_stock/src/configs/app_route.dart';
import 'package:my_stock/src/pages/login/background_theme.dart';
import 'package:my_stock/src/view_models/menu_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'tanakorn',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('iblurblur .dev'),
            accountEmail: Text('iblurblur@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://miro.medium.com/fit/c/160/160/1*nE4OFcqk2kx2-Lzhey8QKA.png',
              ),
            ),
            decoration: BoxDecoration(
              gradient: BackGroundTheme.gradient,
            ),
          ),
          ...MenuViewModel()
              .items
              .map(
                (e) => ListTile(
                  onTap: (){
                    e.onTap(context);
                  },
                  leading: Icon(
                    e.icon,
                    color: e.iconColor,
                  ),
                  title: Text(e.title),
                ),
              )
              .toList(),
          Spacer(),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.loginRoute, (route) => false);
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
