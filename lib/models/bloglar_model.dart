class BloglarModel {
  final String link;
  final String yazi;
  final String baslik;

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'yazi': yazi,
      'baslik': baslik,
    };
  }

  BloglarModel.fromMap(Map<String, dynamic> map)
      : link = map['link'],
        yazi = map['yazi'],
        baslik = map['baslik'];
}