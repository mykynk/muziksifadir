import 'package:flutter/material.dart';

Size _size(BuildContext context) {
  return MediaQuery.of(context).size;
}

double height(BuildContext context) {
  return _size(context).height;
}

double width(BuildContext context) {
  return _size(context).width;
}

double ort(BuildContext context) {
  return (height(context) * width(context)) / 2;
}
