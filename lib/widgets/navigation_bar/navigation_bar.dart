import 'package:flutter/material.dart';
import 'package:muziksifadir/widgets/navigation_bar/navigation_bar_masaustu.dart';
import 'package:muziksifadir/widgets/navigation_bar/navigation_bar_mobil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobil(),
      desktop: NavigationBarMasaustu(),
    );
  }
}
