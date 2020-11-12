import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/models/hakkinda_model/hakkinda_model.dart';
import 'package:muziksifadir/models/hakkinda_model/ssk_model.dart';
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
  HakkindaModel hakkinda;
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
          hakkinda = value;
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
                child: ListView(controller: _controller, children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      hakkinda.photo_url,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      hakkinda.baslik,
                      style: defaultTextStyle,
                    ),
                  ),
                  ..._paragrafList(context),
                  ..._akademisyenList(context),
                  ..._sskList(context),
                ]),
              ),
              Container(
                height: 100,
                color: _backgroundColor,
              ),
            ],
          ))
        : Container();
  }

  List<Widget> _paragrafList(BuildContext context) {
    var paragraflar = List<Widget>();

    for (var i = 0; i < hakkinda.paragraflar.length; i++) {
      paragraflar.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(hakkinda.paragraflar[i] + "\n"),
      ));
    }

    return paragraflar;
  }

  List<Widget> _akademisyenList(BuildContext context) {
    var akademisyenler = List<Widget>();
    akademisyenler.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "\nBirlikte Çalıştığı Akademisyenler:",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ));
    for (var i = 0; i < hakkinda.akademisyenler.length; i++) {
      akademisyenler.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(hakkinda.akademisyenler[i]),
      ));
    }

    return akademisyenler;
  }

  List<Widget> _sskList(BuildContext context) {
    var akademisyenler = List<Widget>();
    akademisyenler.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "\nBAŞLICA SEMİNER-SEMPOZYUM-KONSER:",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ));
    for (var i = 0; i < hakkinda.ssk.length; i++) {
      SSK oAnkiSSK = SSK.fromMap(hakkinda.ssk[i]);
      akademisyenler.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RichText(
            text: TextSpan(children: [
              TextSpan(text: oAnkiSSK.isim+ "\n"),
              TextSpan(text: oAnkiSSK.yer + "\n"),
            ],style: TextStyle(color:Colors.black)),
          ),
      ));
    }

    return akademisyenler;
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
