import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:muziksifadir/styles/text_styles.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';

class Hakkinda extends StatefulWidget {
  const Hakkinda({Key key}) : super(key: key);

  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  ScrollController _controller;
  Color _backgroundColor = Colors.transparent;

  bool girdiMi = false;
  SayfalarModel _sayfalarModel;
  String photoUrl = "";
  String yazi = "";
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _sayfalarModel = Provider.of<SayfalarModel>(context);

    if (!girdiMi) {
      _sayfalarModel.hakkindaGetir().then((value) {
        setState(() {
          photoUrl = value[0];
          yazi = value[1];
          girdiMi = true;
        });
      });
    }
    return _sayfalarModel.state == SayfalarViewState.Idle
        ? Container(
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
                      child: Image.network(
                        photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(58.0),
                      child: Text(
                        yazi,
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
          ))
        : Container();
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
