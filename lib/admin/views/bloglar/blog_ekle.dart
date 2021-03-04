import 'package:flutter/material.dart';
import 'package:muziksifadir/models/hakkinda_model/hakkinda_model.dart';
import 'package:muziksifadir/models/hakkinda_model/paragraf_model.dart';
import 'package:muziksifadir/models/hakkinda_model/ssk_model.dart';
import 'package:muziksifadir/viewmodel/admin_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';
import 'package:image_picker_web/image_picker_web.dart';

class BlogEkle extends StatefulWidget {
  BlogEkle({Key key}) : super(key: key);

  @override
  _BlogEkleState createState() => _BlogEkleState();
}

class _BlogEkleState extends State<BlogEkle> {
  HakkindaModel hakkinda;
  SayfalarModel _sayfalarModel;
  AdminModel _adminModel;
  Paragraf paragraf;
  List<Paragraf> paragrafList = [];
  static MediaInfo pickedImage;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController;
  static List<String> textList = [""];
  static List<Tur> turList = [Tur.paragraf];
  Tur _tur = Tur.paragraf;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _sayfalarModel = Provider.of<SayfalarModel>(context);
    _adminModel = Provider.of<AdminModel>(context);
   

    return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ..._getText(),
                        SizedBox(
                          height: 40,
                        ),
                        FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              for (int i = 0; i < turList.length - 1; i++) {
                                Paragraf _paragraf = Paragraf.fromMap({
                                  "text": textList[i],
                                  "tur": turList[i + 1].toString(),
                                });
                                paragrafList.add(_paragraf);
                              }
                              /* bool sonuc = await _sayfalarModel
                                  .hakkindaKaydet(paragrafList);
                              if (sonuc) {
                                paragrafList.clear();
                                debugPrint("KAYDEDİLDİ");
                              }*/
                            }
                          },
                          child: Text('Submit'),
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ;
  }

// burada sıkıntı yok
  List<Widget> _getText() {
    List<Widget> textFields = [];
    for (int i = 0; i < textList.length; i++) {
      textFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                i != textList.length - 1
                    ? Expanded(child: MyTextFields(i))
                    : Container(),
                SizedBox(
                  width: 16,
                ),
                _addRemoveButton(i == textList.length - 1, i),
              ],
            ),
          ],
        ),
      ));
    }
    return textFields;
  }

  

//burada da yok
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          textList.insert(textList.length - 1, null);
          turList.insert(turList.length - 1, Tur.paragraf);
        } else {
          debugPrint("index : " + index.toString());
          textList.removeAt(index);
          turList.removeAt(index + 1);
          // paragrafList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MyTextFields extends StatefulWidget {
  final int index;
  MyTextFields(this.index);
  @override
  _MyTextFieldsState createState() => _MyTextFieldsState();
}

class _MyTextFieldsState extends State<MyTextFields> {
  TextEditingController _textController;
  Tur _tur = Tur.paragraf;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _textController.text = _BlogEkleState.textList[widget.index] ?? '';
    });

    return Column(
      children: [
        TextFormField(
          maxLines: 10,
          minLines: 1,
          controller: _textController,
          onChanged: (v) => _BlogEkleState.textList[widget.index] = v,
          decoration: InputDecoration(hintText: 'enter something'),
          validator: (v) {
            if (v.trim().isEmpty) return 'Please enter something';
            return null;
          },
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text('paragraf'),
                leading: Radio(
                  value: Tur.paragraf,
                  groupValue: _BlogEkleState.turList[widget.index + 1],
                  onChanged: (Tur value) {
                    setState(() {
                      _BlogEkleState.turList[widget.index + 1] = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('baslik'),
                leading: Radio(
                  value: Tur.baslik,
                  groupValue: _BlogEkleState.turList[widget.index + 1],
                  onChanged: (Tur value) {
                    setState(() {
                      _BlogEkleState.turList[widget.index + 1] = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('yanBaslik'),
                leading: Radio(
                  value: Tur.yanBaslik,
                  groupValue: _BlogEkleState.turList[widget.index + 1],
                  onChanged: (Tur value) {
                    setState(() {
                      _BlogEkleState.turList[widget.index + 1] = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('fotograf'),
                leading: Radio(
                  value: Tur.fotograf,
                  groupValue: _BlogEkleState.turList[widget.index + 1],
                  onChanged: (Tur value) {
                    pickImageFromGallery() ;
                    setState(() {
                      _BlogEkleState.turList[widget.index + 1] = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
   pickImageFromGallery() async {
    final imageFile = await ImagePickerWeb.getImageInfo;
    if (imageFile != null) {
      setState(() {
        _BlogEkleState.pickedImage = imageFile;
      });
    }
  }
}
