import 'package:flutter/material.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/models/anasayfa_model.dart';
import 'package:muziksifadir/models/bizden_soylemesi_model.dart';
import 'package:muziksifadir/models/hakkinda_model/hakkinda_model.dart';
import 'package:muziksifadir/models/hakkinda_model/paragraf_model.dart';
import 'package:muziksifadir/models/bloglar_model.dart';
import 'package:muziksifadir/models/sizden_gelenler_model.dart';
import 'package:muziksifadir/services/firestore_db_service.dart';

enum SayfalarViewState { Idle, Busy }

class SayfalarModel with ChangeNotifier {
  SayfalarViewState _state = SayfalarViewState.Idle;
  FirestoreDbService _firestoreDbService = locator<FirestoreDbService>();

  SayfalarViewState get state => _state;

  Future<AnaSayfaModel> anaSayfaGetir() async {
    _state = SayfalarViewState.Busy;
    Map gelenMap = await _firestoreDbService.anaSayfaGetir();
    AnaSayfaModel anaSayfa = AnaSayfaModel.fromMap(gelenMap);
    print("anaSayfa getiriliyor");
    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return anaSayfa;
  }
  Future<bool> anaSayfaKaydet(List paragrafList) async {
    _state = SayfalarViewState.Busy;
    bool kaydet = await _firestoreDbService.anaSayfaKaydet(paragrafList);

    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return kaydet;
  }


  Future<HakkindaModel> hakkindaGetir() async {
    _state = SayfalarViewState.Busy;
    Map gelenMap = await _firestoreDbService.hakkindaGetir();
    HakkindaModel hakkinda = HakkindaModel.fromMap(gelenMap);
    print("hakkında getiriliyor");
    _state = SayfalarViewState.Idle;
    notifyListeners();
    return hakkinda;
  }

  Future<bool> hakkindaKaydet(List paragrafList) async {
    _state = SayfalarViewState.Busy;
    bool kaydet = await _firestoreDbService.hakkindaKaydet(paragrafList);

    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return kaydet;
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

  Future<List<BloglarModel>> makaleGetir() async {
    _state = SayfalarViewState.Busy;
    List gelenListe = await _firestoreDbService.listeGetir('bloglar');
    List<BloglarModel> makaleListe = [];
    gelenListe.forEach((element) {
      makaleListe.add(BloglarModel.fromMap(element));
    });
    print("Makale getiriliyor");
    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return makaleListe;
  }

  Future<List<BloglarModel>> roportajGetir() async {
    _state = SayfalarViewState.Busy;
    List gelenListe = await _firestoreDbService.listeGetir('roportajler');
    List<BloglarModel> roportajListe = [];
    gelenListe.forEach((element) {
      roportajListe.add(BloglarModel.fromMap(element));
    });
    print("Makale getiriliyor");
    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return roportajListe;
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
