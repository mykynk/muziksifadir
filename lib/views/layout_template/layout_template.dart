import 'package:flutter/material.dart';
import 'package:muziksifadir/widgets/navigation_bar/navigation_bar.dart';
import 'package:muziksifadir/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  LayoutTemplate({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType != DeviceScreenType.desktop
            ? NavigationDrawer()
            : null,
        body: Stack(
          children: [
            child,
            NavigationBar(),
          ],
        ),
      ),
    );
  }
}

/**
 * Anasayfa
 * Hakkında
 * BizdenSoylemesi
 * İletişim
 * Bloglar
 * Sizden Gelenler
 */
