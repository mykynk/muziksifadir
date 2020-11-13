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
                  onTap: ()=>uploadImage(),
                    child: Image.network(hakkinda.photo_url),
                  ),
                ),
                ..._paragrafList(context)
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
        child: TextFormField(initialValue :hakkinda.paragraflar[i] + "\n",maxLines: 5,minLines: 1,),
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
