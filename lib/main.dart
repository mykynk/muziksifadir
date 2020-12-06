import 'package:flutter/material.dart';
import 'package:muziksifadir/views/layout_template/layout_template.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/routing/route_names.dart';
import 'package:muziksifadir/routing/router.dart';
import 'package:muziksifadir/services/navigation_services.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Müzik Şifadır',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      builder: (context, child) => LayoutTemplate(child: child),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: AnaSayfaRoute,
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/app_colors.dart';
import 'package:muziksifadir/constants/size.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Müzik Şifadır',
      debugShowCheckedModeBanner: false,
      home: Fotograf(),
    );
  }
}
class Fotograf extends StatelessWidget {
  const Fotograf({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A8187),
        body: Center(
          child: Container(
            height: height(context),
            width: width(context),
            child: Image.asset(
              'assets/images/bertu.png',
              fit: BoxFit.contain,

            ),
          ),
        ),
      );
  }
}
*/