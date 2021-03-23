import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_stock/src/configs/app_route.dart';
import 'package:my_stock/src/pages/login/background_theme.dart';
import 'package:my_stock/src/view_models/menu_viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => ShopListItem(220),
        itemCount: 100,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo
        },
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
                  onTap: () {
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


class ShopListItem extends StatelessWidget {

  final Function press;
  final double maxHeight;

  const ShopListItem(this.maxHeight, {Key key, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildImage(),
            Expanded(
              child: _buildInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildInfo() => Padding(
    padding: EdgeInsets.all(6),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'MacBook M1',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '\$ 30,000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1,112 pieces',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            )
          ],
        ),
      ],
    ),
  );

  Stack _buildImage() {
    final height = maxHeight - 75;
    final productImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTwpqxUPV0asKFE9RQee4GsfjXombs6TM5tw&usqp=CAU';
    return Stack(
      children: [
        productImage != null && productImage.isNotEmpty
            ? Image.network(
          productImage,
          height: height,
          width: double.infinity,
          fit: BoxFit.cover,
        )
            : Image.asset(
          'xxx',
          height: height,
          width: double.infinity,
        ),
        1 > 0
            ? SizedBox()
            : Positioned(
          top: 1,
          right: 1,
          child: Card(
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.box,
                    size: 15.0,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'out of stock',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}