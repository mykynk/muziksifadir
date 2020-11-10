import 'package:flutter/material.dart';
import 'package:muziksifadir/locator.dart';
import 'package:muziksifadir/services/firebase_auth.dart';
import 'package:muziksifadir/services/firestore_db_service.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as path;

enum AdminViewState { Idle, Busy }

class AdminModel with ChangeNotifier {
  AdminViewState _state = AdminViewState.Idle;
  FirestoreDbService _firestoreDbService = locator<FirestoreDbService>();
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();


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

  Future<bool> uploadImage(MediaInfo info, String yol) async{
    Uri url = await uploadImageToFirebaseAndShareDownloadUrl(info, yol);
   await _firestoreDbService.anaSayfaGuncelle(url.toString());
  }

  Future<Uri> uploadImageToFirebaseAndShareDownloadUrl(
      MediaInfo info, String yol) async {
    String mimeType = mime(path.basename(info.fileName));
    final extension = extensionFromMime(mimeType);
    var metadata = fb.UploadMetadata(
      contentType: mimeType,
    );
    fb.StorageReference ref = fb
        .app()
        .storage()
        // .refFromURL('gs://your-projecct-url.com')
        .ref(
            "images/$yol/images_${DateTime.now().millisecondsSinceEpoch}.${extension}");
    fb.UploadTask uploadTask = ref.put(info.data, metadata);
    fb.UploadTaskSnapshot taskSnapshot = await uploadTask.future;
    return taskSnapshot.ref.getDownloadURL();
  }
}
