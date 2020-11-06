import 'package:flutter/material.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  SayfalarModel _sayfalarModel;
  @override
  Widget build(BuildContext context) {
    _sayfalarModel = Provider.of<SayfalarModel>(context);

    return Container(
      child: FutureBuilder(
        future: _sayfalarModel.anaSayfaGetir(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return _sayfalarModel.state != SayfalarViewState.Busy
              ? Image.network(
                  snapshot.data,
                  fit: BoxFit.cover,
                )
              : Container();
        },
      ),
    );
  }
}
