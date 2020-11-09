import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/models/bizden_soylemesi_model.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';

class BizdenSoylemesi extends StatefulWidget {
  BizdenSoylemesi({Key key}) : super(key: key);

  @override
  _BizdenSoylemesiState createState() => _BizdenSoylemesiState();
}

class _BizdenSoylemesiState extends State<BizdenSoylemesi> {
  @override
  Widget build(BuildContext context) {
    final _sayfalarModel = Provider.of<SayfalarModel>(context);
    return Center(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Color(0xFFEDEDF4),
          ),
          Container(
            height: 100,
            width: width(context),
            alignment: Alignment.center,
            color: Color(0xFFEDEDF4),
            child: Text(
              "Bizden Söylemesi",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: _sayfalarModel.bizdenSoylemesiGetir(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return _sayfalarModel.state != SayfalarViewState.Busy
                      ? Container(
                          width: width(context) * 0.8,
                          child: ListView.builder(
                            itemCount: snapshot.data.length+9,
                            itemBuilder: (BuildContext context, int index) {
                              BizdenSoylemesiModel oAnkiEleman =
                                  snapshot.data[0];
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
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                      : CircularProgressIndicator();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}