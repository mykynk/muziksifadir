import 'package:flutter/material.dart';
import 'package:muziksifadir/models/navbar_item_model.dart';
import 'package:muziksifadir/styles/text_styles.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarItemMasaustu extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
      
        padding: EdgeInsets.all(8),
        child: Text(
          model.title,
          style: navBarTextStyle(sizingInformation.deviceScreenType),
        ),
      ),
    );
  }
}
