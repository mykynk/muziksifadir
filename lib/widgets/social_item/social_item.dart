import 'package:flutter/material.dart';
import 'package:muziksifadir/models/social_item_model.dart';
import 'package:muziksifadir/widgets/social_item/social_item_masaustu.dart';
import 'package:provider/provider.dart';
import 'package:muziksifadir/extensions/hover_extensions.dart';



class SocialItem extends StatelessWidget {
  final String image;
  const SocialItem({this.image});

  @override
  Widget build(BuildContext context) {
    var model = SocialItemModel(
      image: image,
    );
    return GestureDetector(
      onTap: () {
        // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
        // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
        // locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Provider.value(
        value: model,
        child: SocialItemMasaustu().showCursorOnHover.moveUpOnHover,
      ),
    );
  }
}
