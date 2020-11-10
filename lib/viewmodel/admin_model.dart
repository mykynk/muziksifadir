import 'package:flutter/material.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/services/firebase_auth.dart';
import 'package:muziksifadir/services/firebase_storage.dart';
import 'package:muziksifadir/services/firestore_db_service.dart';

enum AdminViewState { Idle, Busy }

class AdminModel with ChangeNotifier {
  AdminViewState _state = AdminViewState.Idle;
  FirestoreDbService _firestoreDbService = locator<FirestoreDbService>();
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();

  AdminViewState get state => _state;
  AdminModel() {
    currentUser();
  }
  bool _adminMi;

  bool get adminMi => _adminMi;

  Future<bool> adminGiris(String email, String sifre) async {
    _state = AdminViewState.Busy;
    bool sonuc =
        await _firebaseAuthService.signInWithEmailandPassword(email, sifre);
    _state = AdminViewState.Idle;
    notifyListeners();
    return sonuc;
  }

  Future<bool> currentUser() async {
    _state = AdminViewState.Busy;
    _adminMi = await _firebaseAuthService.currentUser();
    _state = AdminViewState.Idle;
    notifyListeners();
  }
}
