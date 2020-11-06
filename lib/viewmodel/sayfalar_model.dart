import 'package:flutter/material.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/models/bizden_soylemesi_model.dart';
import 'package:muziksifadir/services/firestore_db_service.dart';

enum SayfalarViewState { Idle, Busy }

class SayfalarModel with ChangeNotifier {
  SayfalarViewState _state = SayfalarViewState.Idle;
  FirestoreDbService _firestoreDbService = locator<FirestoreDbService>();

  SayfalarViewState get state => _state;

  Future<String> anaSayfaGetir() async {
    _state = SayfalarViewState.Busy;
    String gelenString = await _firestoreDbService.anaSayfaGetir();

    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return gelenString;
  }

  Future<List<String>> hakkindaGetir() async {
    _state = SayfalarViewState.Busy;
    List<String> gelenStringList = await _firestoreDbService.hakkindaGetir();

    _state = SayfalarViewState.Idle;
    //  notifyListeners();
    return gelenStringList;
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
}
