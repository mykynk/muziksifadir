import 'package:flutter/material.dart';
import 'package:muziksifadir/viewmodel/admin_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';
import 'package:image_picker_web/image_picker_web.dart';

class AdminAnaSayfa extends StatefulWidget {
  AdminAnaSayfa({Key key}) : super(key: key);

  @override
  _AdminAnaSayfaState createState() => _AdminAnaSayfaState();
}

class _AdminAnaSayfaState extends State<AdminAnaSayfa> {
  String _photoUrl = "";
  SayfalarModel _sayfalarModel;
  AdminModel _adminModel;
  bool girdiMi = false;
  @override
  Widget build(BuildContext context) {
    _sayfalarModel = Provider.of<SayfalarModel>(context);
    _adminModel = Provider.of<AdminModel>(context);
    if (!girdiMi) {
      anaSayfaGetir();
    }
    return girdiMi
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                onTap: ()=>uploadImage(),
                  child: Image.network(_photoUrl),
                ),
              )
            ],
          )
        : Container();
  }

  anaSayfaGetir() async {
    _photoUrl = await _sayfalarModel.anaSayfaGetir();
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
