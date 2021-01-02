import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/routing/route_names.dart';
import 'package:muziksifadir/views/iletisim/iletisim.dart';
import 'package:muziksifadir/widgets/navbar_item/navbar_item.dart';
import 'package:muziksifadir/widgets/social_item/social_item.dart';

import 'navbar_logo.dart';

class NavigationBarMasaustu extends StatelessWidget {
  const NavigationBarMasaustu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
     // color: Colors.white.withOpacity(0.3),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NavBarLogo(),
          Expanded(
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                NavBarItem('ANA SAYFA', AnaSayfaRoute),
                SizedBox(width: width(context) * 0.02),
                NavBarItem('HAKKINDA', HakkindaRoute),
                SizedBox(width: width(context) * 0.02),
              /*  NavBarItem('BİZDEN SÖYLEMESİ', BizdenSoylemesiRoute),
                SizedBox(width: width(context) * 0.02),*/
                NavBarItem('BLOG', BloglarRoute),
                SizedBox(width: width(context) * 0.02),
                NavBarItem('SİZDEN GELENLER', SizdenGelenlerRoute),
                SizedBox(width: width(context) * 0.02),
             //   NavBarItem('RÖPORTAJLAR', RoportajlarRoute),
              ],
            ),
          ),
          SocialMediaIcons(),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
