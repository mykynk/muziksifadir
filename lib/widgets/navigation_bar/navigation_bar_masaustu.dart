import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/routing/route_names.dart';
import 'package:muziksifadir/widgets/navbar_item/navbar_item.dart';

import 'navbar_logo.dart';

class NavigationBarMasaustu extends StatelessWidget {
  const NavigationBarMasaustu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
                NavBarItem('Ana Sayfa', AnaSayfaRoute),
                SizedBox(width: width(context) * 0.03),
                NavBarItem('Hakkında', HakkindaRoute),
                SizedBox(width: width(context) * 0.03),
                NavBarItem('Bizden Söylemesi', BizdenSoylemesiRoute),
                SizedBox(width: width(context) * 0.03),
                NavBarItem('Makaleler', MakalelerRoute),
                SizedBox(width: width(context) * 0.03),
                NavBarItem('Sizden Gelenler', SizdenGelenlerRoute),
                SizedBox(width: width(context) * 0.03),
                NavBarItem('Admin', AdminRoute),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.ac_unit),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.access_time_sharp),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add_alarm_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
