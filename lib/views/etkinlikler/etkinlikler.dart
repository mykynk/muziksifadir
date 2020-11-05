import 'package:flutter/material.dart';

class Etkinlikler extends StatefulWidget {
  Etkinlikler({Key key}) : super(key: key);

  @override
  _EtkinliklerState createState() => _EtkinliklerState();
}

class _EtkinliklerState extends State<Etkinlikler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Etkinlikler"),
    );
  }
}
