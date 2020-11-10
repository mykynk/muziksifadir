import 'package:flutter/material.dart';

class AdminHakkinda extends StatefulWidget {
  AdminHakkinda({Key key}) : super(key: key);

  @override
  _AdminHakkindaState createState() => _AdminHakkindaState();
}

class _AdminHakkindaState extends State<AdminHakkinda> {
  
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