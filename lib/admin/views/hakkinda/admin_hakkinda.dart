import 'package:flutter/material.dart';
import 'package:muziksifadir/models/hakkinda_model/hakkinda_model.dart';
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
                )
              ],
            ),
        )
        : Container();
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
