import 'package:flutter/material.dart';
import 'package:muziksifadir/views/bloglar/bloglar_masaustu.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Bloglar extends StatefulWidget {
  Bloglar({Key key}) : super(key: key);

  @override
  _BloglarState createState() => _BloglarState();
}

class _BloglarState extends State<Bloglar> {
   @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
     // mobile: SizdenGelenlerMobil(),
      desktop: BloglarMasaustu(),
    );
  }
}
