import 'package:flutter/material.dart';
import 'package:muziksifadir/routing/route_names.dart';
import 'package:muziksifadir/widgets/navbar_item/navbar_item.dart';
import 'package:muziksifadir/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          NavBarItem(
            'Ana Sayfa',
            AnaSayfaRoute,
            icon: Icons.home,
          ),
          NavBarItem('Hakkında', HakkindaRoute, icon: Icons.photo),
         /* NavBarItem(
            'Bizden Söylemesi',
            BizdenSoylemesiRoute,
            icon: Icons.home,
          ),*/
       //   NavBarItem('İletişim', HakkindaRoute, icon: Icons.photo),
          NavBarItem(
            'Makaleler',
            MakalelerRoute,
            icon: Icons.home,
          ),
          NavBarItem('Sizden Gelenler', SizdenGelenlerRoute, icon: Icons.photo),
        ],
      ),
    );
  }
} /**
 * Anasayfa
 * Hakkinda
 * Hakkında
 * BizdenSoylemesi
 * İletişim
 * Makaleler
 * Sizden Gelenler
 */
