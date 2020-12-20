import 'package:flutter/material.dart';
import 'package:muziksifadir/models/social_item_model.dart';
import 'package:muziksifadir/widgets/social_item/social_item_masaustu.dart';
import 'package:provider/provider.dart';
import 'package:muziksifadir/extensions/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';



class SocialItem extends StatelessWidget {
  final String image;
  final String url;
  const SocialItem({this.image, this.url});

  @override
  Widget build(BuildContext context) {
    var model = SocialItemModel(
      url: url,
      image: image,
    );
    return GestureDetector(
      onTap: () =>_launchURL(url),
      child: Provider.value(
        value: model,
        child: SocialItemMasaustu().showCursorOnHover.moveUpOnHover,
      ),
    );
  }
  _launchURL(String url) async {

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

}
