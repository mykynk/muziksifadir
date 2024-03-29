import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/app_colors.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/models/roportaj_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Roportajlar extends StatefulWidget {
  Roportajlar({Key key}) : super(key: key);

  @override
  _RoportajlarState createState() => _RoportajlarState();
}

class _RoportajlarState extends State<Roportajlar> {
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
                      image: AssetImage('assets/images/mor.png'),
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
                        "Röportajlar",
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54,
                            fontFamily: "Bebas Neue"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            /*
            child: Container(
              child: FutureBuilder(
                future: _sayfalarModel.roportajGetir(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return _sayfalarModel.state != SayfalarViewState.Busy
                      ? Container(
                          width: width(context) * 0.8,
                          child: ListView.builder(
                            itemCount: snapshot.data.length + 9,
                            itemBuilder: (BuildContext context, int index) {
                              RoportajModel oAnkiEleman = snapshot.data[0];
                              return Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.fromLTRB(50, 20, 50, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Today\n03:00"),
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
                                        Text(
                                          oAnkiEleman.baslik,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          oAnkiEleman.yazi,
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
            ),*/
            child :Container(
                color: Colors.white,
                child: Center(
                    child: Text(
                  "Çok yakında sizlerle.",
                ))),
          ),
        ],
      ),
    );
  }
}
