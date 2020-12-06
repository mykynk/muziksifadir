import 'package:flutter/material.dart';
import 'package:muziksifadir/models/hakkinda_model/hakkinda_model.dart';
import 'package:muziksifadir/models/hakkinda_model/ssk_model.dart';
import 'package:muziksifadir/viewmodel/admin_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';
import 'package:image_picker_web/image_picker_web.dart';

class AdminHakkinda extends StatefulWidget {
  AdminHakkinda({Key key}) : super(key: key);

  @override
  _AdminHakkindaState createState() => _AdminHakkindaState();
}

class _AdminHakkindaState extends State<AdminHakkinda> {
  HakkindaModel hakkinda;
  SayfalarModel _sayfalarModel;
  AdminModel _adminModel;
  bool girdiMi = false;
  
  @override
  Widget build(BuildContext context) {
    _sayfalarModel = Provider.of<SayfalarModel>(context);
    _adminModel = Provider.of<AdminModel>(context);
    if (!girdiMi) {
      girdiMi = true;
      hakkindaGetir();
    }

    return girdiMi && _sayfalarModel.state == SayfalarViewState.Idle
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => uploadImage(),
                    child: Image.network(hakkinda.photo_url),
                  ),
                ),
                ..._paragrafList(context),
                ..._akademisyenList(context),
                ..._sskList(context),
              ],
            ),
          )
        : Container();
  }

  List<Widget> _paragrafList(BuildContext context) {
    var paragraflar = List<Widget>();

    for (var i = 0; i < hakkinda.paragraflar.length; i++) {
      paragraflar.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(initialValue: hakkinda.paragraflar[i] + "\n"),
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
          Text(
            "\nBirlikte Çalıştığı Akademisyenler:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
              akademisyenler.insert(0,Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(initialValue: "Yeni eklendi",),
              ));
              });
            },
          )
        ],
      ),
    ));
    for (var i = 0; i < hakkinda.akademisyenler.length; i++) {
      akademisyenler.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(initialValue: hakkinda.akademisyenler[i]),
      ));
    }

    return akademisyenler;
  }

  List<Widget> _sskList(BuildContext context) {
    var ssklar = List<Widget>();
    ssklar.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "\nBAŞLICA SEMİNER-SEMPOZYUM-KONSER:",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ));
    for (var i = 0; i < hakkinda.ssk.length; i++) {
      SSK oAnkiSSK = SSK.fromMap(hakkinda.ssk[i]);
      ssklar.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
                initialValue: oAnkiSSK.isim, minLines: 1, maxLines: 3),
            TextFormField(initialValue: oAnkiSSK.yer),
          ],
        ),
      ));
    }

    return ssklar;
  }

  hakkindaGetir() async {
    hakkinda = await _sayfalarModel.hakkindaGetir();
    setState(() {
      girdiMi = true;
    });
  }

  uploadImage() async {
    MediaInfo mediaInfo = await ImagePickerWeb.getImageInfo;
    await _adminModel.uploadImage(mediaInfo, 'images');
    setState(() {
      girdiMi = false;
    });
  }
}