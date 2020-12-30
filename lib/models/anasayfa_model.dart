
class AnaSayfaModel {
  final String photo_url;
  final List paragraf;

  Map<String, dynamic> toMap() {
    return {
      'photo_url': photo_url,
      'paragraf': paragraf,
    };
  }

  AnaSayfaModel.fromMap(Map<String, dynamic> map)
      : photo_url = map['photo_url'],
        paragraf = map['paragraf'];
}
