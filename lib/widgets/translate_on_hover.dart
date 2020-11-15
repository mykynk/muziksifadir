import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/app_colors.dart';

class TranslateOnHover extends StatefulWidget {
  final Widget child;
  final String title;
  TranslateOnHover({Key key, this.child, this.title}) : super(key: key);

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0, -7, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),

      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: widget.child,
            transform: _hovering ? hoverTransform : nonHoverTransform,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: _hovering ? 75 : 0,
            height: 2,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
      
    });
  }
}
