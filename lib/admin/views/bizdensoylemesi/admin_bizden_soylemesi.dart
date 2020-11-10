import 'package:flutter/material.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';

class AdminBizdenSoylemesi extends StatefulWidget {
  AdminBizdenSoylemesi({Key key}) : super(key: key);

  @override
  _AdminBizdenSoylemesiState createState() => _AdminBizdenSoylemesiState();
}

class _AdminBizdenSoylemesiState extends State<AdminBizdenSoylemesi> {
  SayfalarModel _sayfalarModel;
  bool girdiMi = false;
  @override
  Widget build(BuildContext context) {
    _sayfalarModel = Provider.of<SayfalarModel>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: "sa",
          ),
        )
      ],
    );
  }
}
