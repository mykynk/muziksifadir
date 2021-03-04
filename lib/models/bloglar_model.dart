import 'package:cloud_firestore/cloud_firestore.dart';

class BloglarModel {
  final String kategori;
  final List yazi;
  final String baslik;
  final String yazar;
  final String photoURL;
  final FieldValue tarih;

  Map<String, dynamic> toMap() {
    return {
      'kategori': kategori,
      'yazi': yazi,
      'baslik': baslik,
      'yazar': yazar,
      'photoURL': photoURL,
      'tarih': FieldValue.serverTimestamp(),
    };
  }

  BloglarModel.fromMap(Map<String, dynamic> map)
      : kategori = map['kategori'],
        yazi = map['yazi'],
        baslik = map['baslik'],
        yazar = map['yazar'],
        tarih = map['tarih'],
        photoURL = map['photoURL'];
}