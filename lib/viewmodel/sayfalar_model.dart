import 'package:flutter/material.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/models/bizden_soylemesi_model.dart';
import 'package:muziksifadir/models/hakkinda_model/hakkinda_model.dart';
import 'package:muziksifadir/models/makale_model.dart';
import 'package:muziksifadir/models/sizden_gelenler_model.dart';
import 'package:muziksifadir/services/firestore_db_service.dart';

enum SayfalarViewState { Idle, Busy }

class SayfalarModel with ChangeNotifier {
  SayfalarViewState _state = SayfalarViewState.Idle;
  FirestoreDbService _firestoreDbService = locator<FirestoreDbService>();

  SayfalarViewState get state => _state;

  Future<String> anaSayfaGetir() async {
    _state = SayfalarViewState.Busy;
    String gelenString = await _firestoreDbService.anaSayfaGetir();
    print("anaSayfa getiriliyor");

    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return gelenString;
  }

  Future<HakkindaModel> hakkindaGetir() async {
    _state = SayfalarViewState.Busy;
    Map gelenMap = await _firestoreDbService.hakkindaGetir();
    HakkindaModel hakkinda = HakkindaModel.fromMap(gelenMap);
    print("hakkında getiriliyor");
    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return hakkinda;
  }

  Future<List<BizdenSoylemesiModel>> bizdenSoylemesiGetir() async {
    _state = SayfalarViewState.Busy;
    List gelenListe = await _firestoreDbService.listeGetir('bizdensoylemesi');
    List<BizdenSoylemesiModel> bizdensoylemesiListe = [];
    gelenListe.forEach((element) {
      bizdensoylemesiListe.add(BizdenSoylemesiModel.fromMap(element));
    });
    print("Bizden söylemesi getiriliyor");
    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return bizdensoylemesiListe;
  }

  Future<List<MakaleModel>> makaleGetir() async {
    _state = SayfalarViewState.Busy;
    List gelenListe = await _firestoreDbService.listeGetir('makaleler');
    List<MakaleModel> makaleListe = [];
    gelenListe.forEach((element) {
      makaleListe.add(MakaleModel.fromMap(element));
    });
    print("Makale getiriliyor");
    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return makaleListe;
  }

  Future<List<SizdenGelenlerModel>> sizdenGelenlerGetir() async {
    _state = SayfalarViewState.Busy;
    List gelenListe = await _firestoreDbService.listeGetir('sizdengelenler');
    List<SizdenGelenlerModel> sizdenGelenlerListe = [];
    gelenListe.forEach((element) {
      sizdenGelenlerListe.add(SizdenGelenlerModel.fromMap(element));
    });
    print("SizdenGelenler getiriliyor");
    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return sizdenGelenlerListe;
  }
}
