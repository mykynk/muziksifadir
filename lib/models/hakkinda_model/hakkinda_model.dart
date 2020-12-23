import 'package:muziksifadir/models/hakkinda_model/ssk_model.dart';

class HakkindaModel {
  final String photo_url;
  final List paragraf;

  Map<String, dynamic> toMap() {
    return {
      'photo_url': photo_url,
      'paragraf': paragraf,
    };
  }

  HakkindaModel.fromMap(Map<String, dynamic> map)
      : photo_url = map['photo_url'],
        paragraf = map['paragraf'];
}
