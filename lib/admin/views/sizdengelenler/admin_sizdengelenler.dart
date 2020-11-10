import 'package:flutter/material.dart';

class AdminSizdenGelenler extends StatefulWidget {
  AdminSizdenGelenler({Key key}) : super(key: key);

  @override
  _AdminSizdenGelenlerState createState() => _AdminSizdenGelenlerState();
}

class _AdminSizdenGelenlerState extends State<AdminSizdenGelenler> {
  
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
             initialValue: "sa",
           ),
         )
       ],
    );
  }
}