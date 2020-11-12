import 'package:muziksifadir/models/hakkinda_model/ssk_model.dart';

class HakkindaModel {
  final String baslik;
  final String photo_url;
  final List akademisyenler;
  final List paragraflar;
  final List ssk;
  

  Map<String, dynamic> toMap() {
    return {
      'photo_url': photo_url,
      'akademisyenler': akademisyenler,
      'paragraflar': paragraflar,
      'ssk': ssk,
      'baslik': baslik,
    };
  }

  HakkindaModel.fromMap(Map<String, dynamic> map)
      : photo_url = map['photo_url'],
        akademisyenler = map['akademisyenler'],
        paragraflar = map['paragraflar'],
        ssk = map['ssk'],
        baslik = map['baslik'];
}
