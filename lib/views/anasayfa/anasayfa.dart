import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/image.jpg',
      fit: BoxFit.cover,
    );
  }
}
