

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDbService  {
  final Firestore _firebaseDB = Firestore.instance;
  
 Future<bool> adminGiris(String email,String sifre) async {
    final okunanMap = await _firebaseDB.collection('admin').document('giris').get();
    if(email == okunanMap.data['email'] && sifre == okunanMap.data['sifre'] ){
      return true;
    }else{
return false;
    }
  
  }
  
  }