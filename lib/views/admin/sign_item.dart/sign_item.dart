import 'package:flutter/material.dart';

class AdminSign extends StatelessWidget {
  AdminSign({Key key}) : super(key: key);
  String _email = "";
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    //      borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    //  borderSide: BorderSide(color: Color(0xFF2F505A)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    //  borderSide: BorderSide(color: Color(0xFF2F505A)),
                  ),
                ),
                validator: (girilenDeger) {
                  if (girilenDeger.length < 3) {
                    return "Başlığın uzunluğu 3'ten küçük olamaz.";
                  }
                },
                onSaved: (girilenDeger) {
                  _email = girilenDeger;
                },
              ),
              TextFormField(
                maxLength: 50,
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
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF2F505A)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF2F505A)),
                  ),
                ),
                validator: (girilenDeger) {
                  if (girilenDeger.length < 3) {
                    return "Başlığın uzunluğu 3'ten küçük olamaz.";
                  }
                },
                onSaved: (girilenDeger) {
                  _email = girilenDeger;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
