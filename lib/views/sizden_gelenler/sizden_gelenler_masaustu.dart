import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/app_colors.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/models/sizden_gelenler_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';

class SizdenGelenlerMasaustu extends StatefulWidget {
  SizdenGelenlerMasaustu({Key key}) : super(key: key);

  @override
  _SizdenGelenlerMasaustuState createState() => _SizdenGelenlerMasaustuState();
}

class _SizdenGelenlerMasaustuState extends State<SizdenGelenlerMasaustu> {
  @override
  Widget build(BuildContext context) {
    final _sayfalarModel = Provider.of<SayfalarModel>(context);
    return Center(
      child: Column(
        children: [
          Stack(
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
                      height: 300,
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
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/yesil.png'),
                      fit: BoxFit.cover,
                    ),
                    //  color: suYesili,
                    //Color(0xFFEDEDF4),
                  ),
                  height: 300,
                  width: width(context) * 0.65,
                  alignment: Alignment(0, 0.5),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width(context) * 0.215,
                      ),
                      Text(
                        "Sizden Gelenler",
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
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: _sayfalarModel.sizdenGelenlerGetir(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return _sayfalarModel.state != SayfalarViewState.Busy
                      ? Container(
                          width: width(context) * 0.8,
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              SizdenGelenlerModel oAnkiEleman =
                                  snapshot.data[0];
                              return Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      oAnkiEleman.isim +
                                          "\n" +
                                          oAnkiEleman.soyisim,
                                    ),
                                    //  Text("Today\n03:00"),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: width(context) * 0.001,
                                      height: 50,
                                      color: Colors.black54,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        /*  Text(
                                          oAnkiEleman.isim + " " + oAnkiEleman.soyisim,
                                        ),*/
                                        //SizedBox(height: 10),
                                        Container(
                                          height: 100,
                                          width: width(context) * 0.55,
                                          child: Text(
                                            oAnkiEleman.yorum,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: 600,
                decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height(context) * 0.05,
                          width: 275,
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 30),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: "Adınız"),
                          ),
                        ),
                        Container(
                          height: height(context) * 0.05,
                          width: 240,
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 30),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Soyadınız",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 550,
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 30),
                      child: TextFormField(
                        maxLines: 5,
                        minLines: 3,
                        decoration: InputDecoration(
                            labelText: "Seanslarımız hakkında düşünceleriniz"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
