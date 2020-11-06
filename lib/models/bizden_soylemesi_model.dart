class BizdenSoylemesiModel {
  final String baslik;
  final String yazi;

  Map<String, dynamic> toMap() {
    return {
      'baslik': baslik,
      'yazi': yazi,
    };
  }

  BizdenSoylemesiModel.fromMap(Map<String, dynamic> map)
      : baslik = map['baslik'],
        yazi = map['yazi'];
}
