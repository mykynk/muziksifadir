import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:muziksifadir/styles/text_styles.dart';

class Hakkinda extends StatefulWidget {
  const Hakkinda({Key key}) : super(key: key);

  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  ScrollController _controller;
  Color _backgroundColor = Colors.transparent;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        DraggableScrollbar.rrect(
          controller: _controller,
          backgroundColor: Colors.grey.withOpacity(0.7),
          heightScrollThumb: 200.0,
          alwaysVisibleScrollThumb: true,
          padding: EdgeInsets.fromLTRB(0, 100, 5, 5),
          child: ListView(
            controller: _controller,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(58.0),
                child: Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam. Elit at imperdiet dui accumsan. Est lorem ipsum dolor sit. Vitae sapien pellentesque habitant morbi. Tempus urna et pharetra pharetra. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam. Viverra ipsum nunc aliquet bibendum enim facilisis. Placerat duis ultricies lacus sed turpis tincidunt. Suspendisse interdum consectetur libero id faucibus nisl tincidunt. Cursus sit amet dictum sit amet justo donec. Tristique nulla aliquet enim tortor at auctor urna nunc.
Vitae nunc sed velit dignissim sodales ut eu. Id ornare arcu odio ut sem nulla pharetra diam. In est ante in nibh mauris cursus mattis molestie. Morbi tristique senectus et netus et malesuada. Tellus elementum sagittis vitae et leo duis ut. Eget nunc lobortis mattis aliquam. Aliquam ultrices sagittis orci a scelerisque. Lorem dolor sed viverra ipsum. Pellentesque sit amet porttitor eget dolor morbi non arcu. Maecenas pharetra convallis posuere morbi leo urna molestie at. Id velit ut tortor pretium viverra. Cursus vitae congue mauris rhoncus aenean vel elit. At urna condimentum mattis pellentesque id nibh tortor. Vitae sapien pellentesque habitant morbi tristique senectus et netus. Malesuada pellentesque elit eget gravida cum sociis natoque. Volutpat maecenas volutpat blandit aliquam. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere. Porta non pulvinar neque laoreet suspendisse interdum.
Pulvinar elementum integer enim neque volutpat ac. Ac felis donec et odio. Ut morbi tincidunt augue interdum velit euismod in pellentesque. Volutpat odio facilisis mauris sit amet massa vitae tortor. Est placerat in egestas erat imperdiet sed. Enim blandit volutpat maecenas volutpat blandit aliquam etiam erat. Scelerisque viverra mauris in aliquam sem. Feugiat vivamus at augue eget arcu. Sodales neque sodales ut etiam sit amet nisl. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Nisl tincidunt eget nullam non nisi est sit. Imperdiet nulla malesuada pellentesque elit. Sem viverra aliquet eget sit amet. Luctus accumsan tortor posuere ac ut consequat semper viverra. Pulvinar pellentesque habitant morbi tristique. Ultricies leo integer malesuada nunc vel risus commodo viverra. Tortor aliquam nulla facilisi cras fermentum. Etiam erat velit scelerisque in dictum non consectetur a. Leo vel orci porta non pulvinar neque laoreet. Sociis natoque penatibus et magnis dis parturient.
Pellentesque habitant morbi tristique senectus et netus et. Id aliquet risus feugiat in. Ullamcorper dignissim cras tincidunt lobortis feugiat. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. Et pharetra pharetra massa massa ultricies mi quis hendrerit dolor. Nibh ipsum consequat nisl vel pretium lectus. Facilisis volutpat est velit egestas dui id ornare. Imperdiet nulla malesuada pellentesque elit eget gravida. Tellus molestie nunc non blandit. Eu sem integer vitae justo eget magna.
Tristique magna sit amet purus gravida quis blandit turpis. Pretium nibh ipsum consequat nisl vel pretium. Diam maecenas sed enim ut sem viverra aliquet eget. Nec ultrices dui sapien eget mi. Convallis posuere morbi leo urna molestie at elementum. Bibendum est ultricies integer quis auctor elit sed vulputate mi. Gravida quis blandit turpis cursus in hac habitasse platea. Fermentum et sollicitudin ac orci phasellus egestas tellus. Tristique nulla aliquet enim tortor at auctor urna nunc id. Aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh.""",
                  style: defaultTextStyle,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 100,
          color: _backgroundColor,
        ),
      ],
    ));
  }

  _scrollListener() {
    if (_controller.offset >= MediaQuery.of(context).size.height * 0.1 &&
        !_controller.position.outOfRange) {
      setState(() {
        _backgroundColor = Colors.red;
      });
    }
    // _controller.position.minScrollExtent
    if (_controller.offset <= MediaQuery.of(context).size.height * 0.1 &&
        !_controller.position.outOfRange) {
      setState(() {
        _backgroundColor = Colors.transparent;
      });
    }
  }
}
