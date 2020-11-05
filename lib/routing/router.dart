import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muziksifadir/routing/route_names.dart';
import 'package:muziksifadir/views/admin/admin.dart';
import 'package:muziksifadir/views/anasayfa/anasayfa.dart';
import 'package:muziksifadir/views/etkinlikler/etkinlikler.dart';
import 'package:muziksifadir/views/hakkinda/hakkinda.dart';
import 'package:muziksifadir/views/makaleler/makaleler.dart';
import 'package:muziksifadir/views/sizden_gelenler/sizden_gelenler.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AnaSayfaRoute:
      return _getPageRoute(AnaSayfa(), settings.name);

    case HakkindaRoute:
      return _getPageRoute(Hakkinda(), settings.name);

    case AdminRoute:
      return _getPageRoute(Admin(), settings.name);

    case MakalelerRoute:
      return _getPageRoute(Makaleler(), settings.name);

    case EtkinliklerRoute:
      return _getPageRoute(Etkinlikler(), settings.name);

    case SizdenGelenlerRoute:
      return _getPageRoute(SizdenGelenler(), settings.name);

    default:
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            settings: RouteSettings(name: routeName),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}
