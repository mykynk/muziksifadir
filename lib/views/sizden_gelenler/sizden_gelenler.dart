import 'package:flutter/material.dart';
import 'package:muziksifadir/views/sizden_gelenler/sizden_gelenler_masaustu.dart';
import 'package:muziksifadir/views/sizden_gelenler/sizden_gelenler_mobil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SizdenGelenler extends StatefulWidget {
  SizdenGelenler({Key key}) : super(key: key);

  @override
  _SizdenGelenlerState createState() => _SizdenGelenlerState();
}

class _SizdenGelenlerState extends State<SizdenGelenler> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SizdenGelenlerMobil(),
      desktop: SizdenGelenlerMasaustu(),
    );
  }
}
