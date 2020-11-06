class MakaleModel {
  final String link;
  final String yazi;

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'yazi': yazi,
    };
  }

  MakaleModel.fromMap(Map<String, dynamic> map)
      : link = map['link'],
        yazi = map['yazi'];
}
