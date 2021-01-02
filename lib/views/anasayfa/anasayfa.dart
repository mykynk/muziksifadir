import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/models/anasayfa_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  AnaSayfaModel anaSayfa;

  SayfalarModel _sayfalarModel;
  YoutubePlayerController _controllerYoutube = YoutubePlayerController(
    initialVideoId: 'fS_cYA9_WK8',
    params: YoutubePlayerParams(
      // playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: true,
    ),
  );
  ScrollController _controller;
  double _offset = 0, size = 0.50, sizeNavBar = 0.25;
  bool girdiMi = false;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _sayfalarModel = Provider.of<SayfalarModel>(context);
    if (!girdiMi) {
      _sayfalarModel.anaSayfaGetir().then((value) {
        setState(() {
          anaSayfa = value;
          girdiMi = true;
        });
      });
    }
    // if (Scaffold.of(context).isDrawerOpen) {
    //   print("open");
    // }

    return _sayfalarModel.state != SayfalarViewState.Busy
        ? Container(
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  left: -200,
                  top: -100,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/turuncu.png'),
                        fit: BoxFit.contain,
                      ),
                      //  color: suYesili,
                      color: Color(0xFFFFFFFF),
                    ),
                    height: height(context) * size,
                    width: height(context) * size,
                    alignment: Alignment(0, 0.5),
                    duration: Duration(milliseconds: 100),
                  ),
                ),
                DraggableScrollbar.rrect(
                  controller: _controller,
                  backgroundColor: Color(0xAAEFB183),
                  heightScrollThumb: 200.0,
                  alwaysVisibleScrollThumb: true,
                  padding: EdgeInsets.fromLTRB(0, 100, 5, 5),
                  child: ListView(controller: _controller, children: <Widget>[
                    Container(
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: width(context) * 0.015),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20)),
                          //  padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(width: width(context) * 0.015),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: width(context) * 0.505,
                                  width: width(context) * 0.900,
                                  child: YoutubePlayerIFrame(
                                    controller: _controllerYoutube,
                                    aspectRatio: 16 / 9,
                                  ),
                                ),
                              ),
                              SizedBox(width: width(context) * 0.05),
                              Container(
                                width: width(context) * 0.9,
                                child: Column(
                                  children: [
                                    SizedBox(height: height(context) * 0.025),
                                    ..._paragrafList(context),
                                    SizedBox(height: height(context) * 0.015),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: width(context) * 0.015),
                      ],
                    ),
                  ]),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: AnimatedContainer(
                      height: 100,
                      width: width(context) * sizeNavBar,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(0))),
                      duration: Duration(),
                    )),
              ],
            ),
          )
        : Container();
  }

  _scrollListener() {
    if (_controller.offset >= MediaQuery.of(context).size.height * 0.4 &&
        !_controller.position.outOfRange) {
      setState(() {
        /*_backgroundColor = krem;
        _goster = true;*/
        size = 0.30;
      });
    }
    // _controller.position.minScrollExtent
    if (_controller.offset <= MediaQuery.of(context).size.height * 0.4 &&
        !_controller.position.outOfRange) {
      setState(() {
        /*     _backgroundColor = Colors.transparent;
        _goster = false;*/
      });
    }
  }

  onScroll() {
    setState(() {
      if (_controller.offset < 1000 && _controller.offset > 100) {
        double temp =
            ((_controller.offset + 100) * height(context) / (28 * 10)) * 0.0004;
            if(temp>0.5){

        size = temp;
            }
        sizeNavBar =
            ((_controller.offset + 100) * height(context) / (28 * 10)) * 0.0004;
      }
    });
  }

  List<Widget> _paragrafList(BuildContext context) {
    var paragraflar = <Widget>[];

    for (var i = 0; i < anaSayfa.paragraf.length; i++) {
      paragraflar.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            SizedBox(width: width(context) * 0.01),
            Expanded(
              child: Text(
                anaSayfa.paragraf[i]["text"] + "\n",
                style: anaSayfa.paragraf[i]["tur"] == "Tur.yanBaslik"
                    ? TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.65))
                    : TextStyle(
                        fontSize: 18, color: Colors.black.withOpacity(0.8)),
              ),
            ),
            SizedBox(width: width(context) * 0.01),
          ],
        ),
      ));
    }

    return paragraflar;
  }
}
