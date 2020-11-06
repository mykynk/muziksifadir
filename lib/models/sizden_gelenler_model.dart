class SizdenGelenlerModel {
  final String isim;
  final String soyisim;
  final String yorum;

  Map<String, dynamic> toMap() {
    return {
      'isim': isim,
      'soyisim': soyisim,
      'yorum': yorum,
    };
  }

  SizdenGelenlerModel.fromMap(Map<String, dynamic> map)
      : isim = map['isim'],
        soyisim = map['soyisim'],
        yorum = map['yorum'];
}
