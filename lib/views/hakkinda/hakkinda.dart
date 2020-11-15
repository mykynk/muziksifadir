import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/app_colors.dart';
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
  bool _goster = false;
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(hakkinda.photo_url))),
                  ),
                  ..._paragrafList(context),
                  ..._akademisyenList(context),
                  ..._sskList(context),
                ]),
              ),
              Stack(
                children: [
                  Container(
                    color: _backgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(500),
                              topRight: Radius.circular(0),
                            ),
                            color: _backgroundColor,
                          ),
                          width: width(context) * 0.3,
                          height: 300,
                        ),
                        /*Container(
                      width: width(context) * 0.7,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(500)),
                        color: krem,
                      ),
                      height: 300,
                    ),*/
                      ],
                    ),
                  ),
                  Container(
                    /* decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage('assets/images/circle.gif'),
                    fit: BoxFit.cover,
                  ),
                    //  color: suYesili,
                    //Color(0xFFEDEDF4),
                    ),*/
                    height: 300,
                    width: width(context),
                    alignment: Alignment(0, 0.5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width(context) * 0.175,
                        ),
                        Text(
                          _goster ? "Hakkında" : "",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ))
        : Container();
  }

  List<Widget> _paragrafList(BuildContext context) {
    var paragraflar = List<Widget>();
    paragraflar.add(Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          SizedBox(width: width(context) * 0.05),
          Text(
            hakkinda.baslik,
            style: defaultTextStyle,
          ),
          SizedBox(width: width(context) * 0.05),
        ],
      ),
    ));
    for (var i = 0; i < hakkinda.paragraflar.length; i++) {
      paragraflar.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(width: width(context) * 0.05),
            Expanded(child: Text(hakkinda.paragraflar[i] + "\n")),
            SizedBox(width: width(context) * 0.05),
          ],
        ),
      ));
    }

    return paragraflar;
  }

  List<Widget> _akademisyenList(BuildContext context) {
    var akademisyenler = List<Widget>();
    akademisyenler.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SizedBox(width: width(context) * 0.05),
          Text(
            "\nBirlikte Çalıştığı Akademisyenler:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: width(context) * 0.05),
        ],
      ),
    ));
    for (var i = 0; i < hakkinda.akademisyenler.length; i++) {
      akademisyenler.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(width: width(context) * 0.05),
            Text(hakkinda.akademisyenler[i]),
            SizedBox(width: width(context) * 0.05),
          ],
        ),
      ));
    }

    return akademisyenler;
  }

  List<Widget> _sskList(BuildContext context) {
    var ssklar = List<Widget>();
    ssklar.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SizedBox(width: width(context) * 0.05),
          Text(
            "\nBAŞLICA SEMİNER-SEMPOZYUM-KONSER:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: width(context) * 0.05),
        ],
      ),
    ));
    for (var i = 0; i < hakkinda.ssk.length; i++) {
      SSK oAnkiSSK = SSK.fromMap(hakkinda.ssk[i]);
      ssklar.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(width: width(context) * 0.05),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: oAnkiSSK.isim + "\n"),
                TextSpan(text: oAnkiSSK.yer + "\n"),
              ], style: TextStyle(color: Colors.black)),
            ),
            SizedBox(width: width(context) * 0.05),
          ],
        ),
      ));
    }

    return ssklar;
  }

  _scrollListener() {
    if (_controller.offset >= MediaQuery.of(context).size.height * 0.1 &&
        !_controller.position.outOfRange) {
      setState(() {
        _backgroundColor = krem;
        _goster = true;
      });
    }
    // _controller.position.minScrollExtent
    if (_controller.offset <= MediaQuery.of(context).size.height * 0.1 &&
        !_controller.position.outOfRange) {
      setState(() {
        _backgroundColor = Colors.transparent;
        _goster = false;
      });
    }
  }
}
