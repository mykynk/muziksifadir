import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<bool> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    if (user != null) {
      if (user.email == 'muziksifadir@gmail.com') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<bool> signInWithEmailandPassword(String email, String sifre) async {
    AuthResult sonuc = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: sifre);
    if (sonuc.user.email == 'muziksifadir@gmail.com') {
      return true;
    } else {
      return false;
    }
  }
}
