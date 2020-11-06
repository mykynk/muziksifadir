import 'package:flutter/material.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/services/firebase_storage.dart';
import 'package:muziksifadir/services/firestore_db_service.dart';

enum IlanViewState { Idle, Busy }

class AdminModel with ChangeNotifier {
  IlanViewState _state = IlanViewState.Idle;
  FirestoreDbService _firestoreDbService = locator<FirestoreDbService>();
  FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();
  
  }