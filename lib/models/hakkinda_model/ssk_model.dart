class SSK {
  final String isim;
  final String yer;

  Map<String, dynamic> toMap() {
    return {
      'isim': isim,
      'yer': yer,
    };
  }

  SSK.fromMap(Map<String, dynamic> map)
      : isim = map['isim'],
        yer = map['yer'];
}
