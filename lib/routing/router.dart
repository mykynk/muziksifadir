import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muziksifadir/routing/route_names.dart';
import 'package:muziksifadir/viewmodel/admin_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:muziksifadir/admin/admin.dart';
import 'package:muziksifadir/admin/admin_control_panel.dart';
import 'package:muziksifadir/views/anasayfa/anasayfa.dart';
import 'package:muziksifadir/views/bizden_soylemesi/bizden_soylemesi.dart';
import 'package:muziksifadir/views/hakkinda/hakkinda.dart';
import 'package:muziksifadir/views/makaleler/makaleler.dart';
import 'package:muziksifadir/views/roportajlar/roportajlar.dart';
import 'package:muziksifadir/views/sizden_gelenler/sizden_gelenler.dart';
import 'package:provider/provider.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AnaSayfaRoute:
      return _getPageRoute(
          ChangeNotifierProvider<SayfalarModel>(
            create: (BuildContext context) => SayfalarModel(),
            child: AnaSayfa(),
          ),
          settings.name);

    case HakkindaRoute:
      return _getPageRoute(
          ChangeNotifierProvider<SayfalarModel>(
            create: (BuildContext context) => SayfalarModel(),
            child: Hakkinda(),
          ),
          settings.name);

    case MakalelerRoute:
      return _getPageRoute(
          ChangeNotifierProvider<SayfalarModel>(
            create: (BuildContext context) => SayfalarModel(),
            child: Makaleler(),
          ),
          settings.name);

    case BizdenSoylemesiRoute:
      return _getPageRoute(
          ChangeNotifierProvider<SayfalarModel>(
              create: (BuildContext context) => SayfalarModel(),
              child: BizdenSoylemesi()),
          settings.name);

    case RoportajlarRoute:
      return _getPageRoute(
          ChangeNotifierProvider<SayfalarModel>(
              create: (BuildContext context) => SayfalarModel(),
              child: Roportajlar()),
          settings.name);

    case SizdenGelenlerRoute:
      return _getPageRoute(
          ChangeNotifierProvider<SayfalarModel>(
            create: (BuildContext context) => SayfalarModel(),
            child: SizdenGelenler(),
          ),
          settings.name);

    case AdminRoute:
      return _getPageRoute(
          ChangeNotifierProvider<AdminModel>(
              create: (BuildContext context) => AdminModel(), child: Admin()),
          settings.name);
    case AdminControlPanelRoute:
      return _getPageRoute(
          ChangeNotifierProvider<AdminModel>(
            create: (BuildContext context) => AdminModel(),
            child: AdminControlPanel(),
          ),
          settings.name);

    case AdminControlPanelRoute + AnaSayfaRoute:
      return _getPageRoute(
          ChangeNotifierProvider<AdminModel>(
            create: (BuildContext context) => AdminModel(),
            child: AnaSayfa(),
          ),
          settings.name);

    case AdminControlPanelRoute + HakkindaRoute:
      return _getPageRoute(
          ChangeNotifierProvider<AdminModel>(
            create: (BuildContext context) => AdminModel(),
            child: Hakkinda(),
          ),
          settings.name);

    case AdminControlPanelRoute + MakalelerRoute:
      return _getPageRoute(
          ChangeNotifierProvider<AdminModel>(
            create: (BuildContext context) => AdminModel(),
            child: Makaleler(),
          ),
          settings.name);

    case AdminControlPanelRoute + BizdenSoylemesiRoute:
      return _getPageRoute(
          ChangeNotifierProvider<AdminModel>(
              create: (BuildContext context) => AdminModel(),
              child: BizdenSoylemesi()),
          settings.name);

    case AdminControlPanelRoute + RoportajlarRoute:
      return _getPageRoute(
          ChangeNotifierProvider<AdminModel>(
              create: (BuildContext context) => AdminModel(),
              child: Roportajlar()),
          settings.name);

    case AdminControlPanelRoute + SizdenGelenlerRoute:
      return _getPageRoute(
          ChangeNotifierProvider<AdminModel>(
            create: (BuildContext context) => AdminModel(),
            child: SizdenGelenler(),
          ),
          settings.name);
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
