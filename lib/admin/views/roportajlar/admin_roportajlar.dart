import 'package:flutter/material.dart';

class AdminRoportajlar extends StatefulWidget {
  AdminRoportajlar({Key key}) : super(key: key);

  @override
  _AdminRoportajlarState createState() => _AdminRoportajlarState();
}

class _AdminRoportajlarState extends State<AdminRoportajlar> {
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
