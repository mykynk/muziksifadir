import 'package:flutter/material.dart';
import 'package:muziksifadir/widgets/navigation_bar/navbar_logo.dart';

class NavigationBarMobil extends StatelessWidget {
  const NavigationBarMobil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: IconButton(
              icon: Center(child: Icon(Icons.menu,size: 32,)),
              onPressed: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Scaffold.of(context).openEndDrawer();
                } else {
                  Scaffold.of(context).openDrawer();
                }
              },
            ),
          ),
          NavBarLogo()
        ],
      ),
    );
  }
}
