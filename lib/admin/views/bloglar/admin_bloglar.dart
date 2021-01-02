import 'package:flutter/material.dart';

class AdminBloglar extends StatefulWidget {
  AdminBloglar({Key key}) : super(key: key);

  @override
  _AdminBloglarState createState() => _AdminBloglarState();
}

class _AdminBloglarState extends State<AdminBloglar> {
  
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