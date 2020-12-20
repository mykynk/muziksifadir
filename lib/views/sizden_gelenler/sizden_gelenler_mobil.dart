import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/models/sizden_gelenler_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';

class SizdenGelenlerMobil extends StatefulWidget {
  SizdenGelenlerMobil({Key key}) : super(key: key);

  @override
  _SizdenGelenlerMobilState createState() => _SizdenGelenlerMobilState();
}

class _SizdenGelenlerMobilState extends State<SizdenGelenlerMobil> {
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
                  width: width(context)*0.65,
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
                              SizdenGelenlerModel oAnkiEleman = snapshot.data[0];
                              return Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                          oAnkiEleman.isim + " " + oAnkiEleman.soyisim,
                                        ),
                                  //  Text("Today\n03:00"),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 20),
                                      height: height(context) * 0.001,
                                      width: width(context) * 0.1,
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
                                          width: width(context) * 0.8,
                                          child: Text(
                                            oAnkiEleman.yorum,
                                            textAlign: TextAlign.justify,
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
        ],
      ),
    );
  }
}
