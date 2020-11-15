import 'package:flutter/material.dart';
import 'package:muziksifadir/widgets/social_item/social_item.dart';

class SocialMediaIcons extends StatefulWidget {
  SocialMediaIcons({Key key}) : super(key: key);

  @override
  SocialMediaIconsState createState() => SocialMediaIconsState();
}

class SocialMediaIconsState extends State<SocialMediaIcons>
{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /*MouseRegion(
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
        ),*/
        SocialItem(image: 'assets/icons/instagram.png'),
        SocialItem(image: 'assets/icons/youtube.png'),
        SocialItem(image: 'assets/icons/gmail.png'),
      ],
    );
  }

 
}
