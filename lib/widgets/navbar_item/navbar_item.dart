import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/app_colors.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/models/navbar_item_model.dart';
import 'package:muziksifadir/services/navigation_services.dart';
import 'package:muziksifadir/widgets/navbar_item/navbar_item_masaustu.dart';
import 'package:muziksifadir/widgets/navbar_item/navbar_item_mobil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:muziksifadir/extensions/hover_extensions.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon,
    );
    return GestureDetector(
     
      onTap: () {
        // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
        // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
        locator<NavigationService>().navigateTo(navigationPath);
        Scaffold.of(context).openEndDrawer();
        secili = title;
      },
      child: Provider.value(
        value: model,
        child: ScreenTypeLayout(
          desktop: NavBarItemMasaustu(),
          mobile: NavBarItemMobil(),
        ).showCursorOnHover.moveUpOnHover,
      ),
    );
  }
}
