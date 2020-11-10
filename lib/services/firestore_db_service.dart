import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDbService {
  final Firestore _firebaseDB = Firestore.instance;

  Future<bool> adminGiris(String email, String sifre) async {
    final okunanMap =
        await _firebaseDB.collection('admin').document('giris').get();
    if (email == okunanMap.data['email'] && sifre == okunanMap.data['sifre']) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> anaSayfaGuncelle(String url) async {
    await _firebaseDB.collection('sayfalar').document('anasayfa').updateData({
      'photo_url': url,
    });
  }

  Future<String> anaSayfaGetir() async {
    final okunanMap =
        await _firebaseDB.collection('sayfalar').document('anasayfa').get();
    String photoUrl = okunanMap.data['photo_url'];
    return photoUrl;
  }

  Future<List<String>> hakkindaGetir() async {
    final okunanMap =
        await _firebaseDB.collection('sayfalar').document('hakkinda').get();
    List<String> liste = [];
    liste.add(okunanMap.data['photo_url']);
    liste.add(okunanMap.data['yazi']);
    return liste;
  }

  Future<List> listeGetir(String sayfa) async {
    final okunanMap =
        await _firebaseDB.collection('sayfalar').document(sayfa).get();
    List liste = okunanMap.data['liste'];

    return liste;
  }
}
