import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muziksifadir/models/hakkinda_model/paragraf_model.dart';

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

  Future<Map> anaSayfaGetir() async {
    final okunanMap =
        await _firebaseDB.collection('sayfalar').document('anasayfa').get();
    return okunanMap.data;
  }

  Future<Map> hakkindaGetir() async {
    final okunanMap =
        await _firebaseDB.collection('sayfalar').document('hakkinda').get();
    return okunanMap.data;
  }

  Future<bool> hakkindaKaydet(List paragrafList) async {
    List<Map> paragrafListMap = [];
    paragrafList.forEach((paragraf) async {
      paragrafListMap.add(paragraf.toMap());
    });
    await _firebaseDB
        .collection('sayfalar')
        .document('hakkinda')
        .setData({"paragraf": paragrafListMap});
    return true;
  }

  Future<bool> anaSayfaKaydet(List paragrafList) async {
    List<Map> paragrafListMap = [];
    paragrafList.forEach((paragraf) async {
      paragrafListMap.add(paragraf.toMap());
    });
    await _firebaseDB
        .collection('sayfalar')
        .document('anasayfa')
        .setData({"paragraf": paragrafListMap});
    return true;
  }

  Future<List> listeGetir(String sayfa) async {
    final okunanMap =
        await _firebaseDB.collection('sayfalar').document(sayfa).get();
    List liste = okunanMap.data['liste'];

    return liste;
  }
}
