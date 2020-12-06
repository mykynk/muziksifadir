import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Returns the style for a page title based on the [deviceScreenType] passed in.
TextStyle titleTextStyle(DeviceScreenType deviceScreenType) {
  double titleSize = deviceScreenType != DeviceScreenType.desktop ? 18 : 25;
  return TextStyle(fontWeight: FontWeight.w600, fontSize: titleSize);
}

/// Return the style for description text on a page based on the [deviceScreenType] passed in.
TextStyle descriptionTextStyle(DeviceScreenType deviceScreenType) {
  double descriptionSize =
      deviceScreenType != DeviceScreenType.desktop ? 16 : 21;

  return TextStyle(
    fontSize: descriptionSize,
    height: 1.7,
  );
}

TextStyle defaultTextStyle = TextStyle(
  fontSize: 18,
  height: 1.7,
);
TextStyle navBarTextStyle(DeviceScreenType deviceScreenType) {
  double navBarTitleSize =
      deviceScreenType == DeviceScreenType.desktop ? 20 : 5;
  return TextStyle(
    fontWeight: FontWeight.w600,
    height: 1.7,
    fontSize: navBarTitleSize,
    color: Colors.black87,
  );
}
