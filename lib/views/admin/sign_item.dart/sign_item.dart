import 'dart:html';

import 'package:flutter/material.dart';
import 'package:muziksifadir/viewmodel/admin_model.dart';
import 'package:muziksifadir/views/admin/admin_control_panel.dart';
import 'package:provider/provider.dart';

class AdminSign extends StatelessWidget {
  AdminSign({Key key}) : super(key: key);
  String _email = "";
  String _sifre = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _adminModel = Provider.of<AdminModel>(context);
    return Container(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                minLines: 1,
                maxLines: 3,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 27.5, 15, 25),
                  labelText: "Email",
                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27.5),
                    borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  ),
                ),
                onSaved: (girilenDeger) {
                  _email = girilenDeger;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                minLines: 1,
                maxLines: 3,
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 27.5, 15, 25),
                  labelText: "Şifre",
                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27.5),
                    borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  ),
                ),
                onSaved: (girilenDeger) {
                  _sifre = girilenDeger;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Giriş Yap"),
                  FlatButton(
                    onPressed: () async {
                      _formKey.currentState.save();
                      bool sonuc = await _adminModel.adminGiris(_email, _sifre);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AdminControlPanel()));
                    },
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
