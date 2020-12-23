import 'package:flutter/foundation.dart';
import 'package:muziksifadir/admin/views/hakkinda/admin_hakkinda.dart';

class Paragraf {
  final String text;
  final Tur tur;

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'tur': tur.toString(),
    };
  }

  Paragraf.fromMap(Map<String, dynamic> map)
      : text = map['text'],
        tur = Tur.values.firstWhere((e) => e.toString() == map['tur']);
}
