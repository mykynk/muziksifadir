import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/views/admin/sign_item.dart/sign_item.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Admin extends StatefulWidget {
  Admin({Key key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScreenTypeLayout(
          mobile: Container(
            width: width(context) * 0.8,
            child: AdminSign(),
          ),
          desktop: Container(
            width: width(context) * 0.3,
            child: AdminSign(),
          ),
        ),
      ),
    );
  }
}
/*
pickImageFromGallery() async {
    final imageFile = await ImagePickerWeb.getImageInfo;
    if (imageFile != null) {
      setState(() {
        pickedImage = imageFile;
      });
    }
  }*/
