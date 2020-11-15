import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SocialMediaIcons extends StatefulWidget {
  SocialMediaIcons({Key key}) : super(key: key);

  @override
  SocialMediaIconsState createState() => SocialMediaIconsState();
}

class SocialMediaIconsState extends State<SocialMediaIcons>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          onEnter: (PointerEnterEvent event) {
            isPlaying = true;
            _handleOnPressed();
            print('a x: ${event.position.dx}, y: ${event.position.dy}');
          },
          onHover: (PointerHoverEvent event) {
            print('b x: ${event.position.dx}, y: ${event.position.dy}');
          },
          onExit: (PointerExitEvent event) {
            isPlaying = false;
            _handleOnPressed();
          },
          child: GestureDetector(
            child: AnimatedIcon(
              icon: AnimatedIcons.view_list,
              progress: _animationController,
            ),
            onTap: () => _handleOnPressed(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.access_time),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.access_time),
        ),
      ],
    );
  }

  void _handleOnPressed() {
    setState(() {
     // isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}
