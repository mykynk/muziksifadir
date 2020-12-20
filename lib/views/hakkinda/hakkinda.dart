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
  double size = 0;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _controller.addListener(onScroll);

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
            color: Colors.white,
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
                      height: MediaQuery.of(context).size.height * 0.6,
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
                _goster
                    ? Stack(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                    //  color: krem,
                                  ),
                                  width: width(context) * 0.3,
                                  height: 200,
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
                          
                          Positioned(
                            left: -80,
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/sari.png'),
                                  fit: BoxFit.cover,
                                ),
                                //  color: suYesili,
                                //Color(0xFFEDEDF4),
                              ),
                              height: 200,
                              width: width(context) * size,
                             
                              duration: Duration(milliseconds: 100),
                            ),
                          ),
                          Positioned(
                            child: Container(
                               height: 200,
                               alignment: Alignment(0, 0.5),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: width(context) * 0.215,
                                    ),
                                    Text(
                                      "Hakkında",
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ))
        : Container();
  }

  List<Widget> _paragrafList(BuildContext context) {
    var paragraflar = <Widget>[];
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
    var akademisyenler = <Widget>[];
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
    var ssklar = <Widget>[];
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
    if (_controller.offset >= MediaQuery.of(context).size.height * 0.4 &&
        !_controller.position.outOfRange) {
      setState(() {
        size = 0.30;
        _backgroundColor = krem;
        _goster = true;
      });
    }
    // _controller.position.minScrollExtent
    if (_controller.offset <= MediaQuery.of(context).size.height * 0.4 &&
        !_controller.position.outOfRange) {
      setState(() {
        _backgroundColor = Colors.transparent;
        _goster = false;
      });
    }
  }

  onScroll() {
    setState(() {

      size = (_controller.offset * height(context) / (28 * 10)) * 0.0002;

    });
  }
}
