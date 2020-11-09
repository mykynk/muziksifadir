import 'package:flutter/material.dart';

class AdminControlPanel extends StatefulWidget {
  AdminControlPanel({Key key}) : super(key: key);

  @override
  _AdminControlPanelState createState() => _AdminControlPanelState();
}

class _AdminControlPanelState extends State<AdminControlPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("ADmin Kontrol Paneli"),
      ),
    );
  }
}
