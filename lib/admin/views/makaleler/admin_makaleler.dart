import 'package:flutter/material.dart';

class AdminMakaleler extends StatefulWidget {
  AdminMakaleler({Key key}) : super(key: key);

  @override
  _AdminMakalelerState createState() => _AdminMakalelerState();
}

class _AdminMakalelerState extends State<AdminMakaleler> {
  
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