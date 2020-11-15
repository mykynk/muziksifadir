import 'package:flutter/material.dart';
import 'package:muziksifadir/models/social_item_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SocialItemMasaustu extends ProviderWidget<SocialItemModel> {
  @override
  Widget build(BuildContext context, SocialItemModel model) {
    return ResponsiveBuilder(
         builder: (context, sizingInformation) =>  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                SizedBox(height: 28,),
                Container(
                    height: 30,
                    child: Image.asset(
                      model.image,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}