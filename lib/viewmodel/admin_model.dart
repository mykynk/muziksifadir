import 'package:flutter/material.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/services/firebase_storage.dart';
import 'package:muziksifadir/services/firestore_db_service.dart';

enum AdminViewState { Idle, Busy }

class AdminModel with ChangeNotifier {
  AdminViewState _state = AdminViewState.Idle;
  FirestoreDbService _firestoreDbService = locator<FirestoreDbService>();
  FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();

  AdminViewState get state => _state;

  Future<bool> adminGiris(String email, String sifre) async {
    _state = AdminViewState.Busy;
    bool sonuc = await _firestoreDbService.adminGiris(email, sifre);
    _state = AdminViewState.Busy;
    notifyListeners();
    return sonuc;
  }
}
