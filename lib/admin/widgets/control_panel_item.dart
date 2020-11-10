import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/services/navigation_services.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/styles/text_styles.dart';

class ControlPanelItem extends StatelessWidget {
  const ControlPanelItem({
    Key key,
    this.title,
    this.icon,
    this.navigationPath,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final String navigationPath;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => GestureDetector(
        onTap: () {
          locator<NavigationService>().navigateTo(navigationPath);
        },
        child: Container(
          height: height(context) * 0.2,
          width: width(context) * 0.2,
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon, size: ort(context) * 0.0001),
              AutoSizeText(
                title,
                style: titleTextStyle(sizingInformation.deviceScreenType),
              )
            ],
          ),
        ),
      ),
    );
  }
}
