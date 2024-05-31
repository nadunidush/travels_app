
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  Future<User?> createUserEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> loginUserEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> signOut()async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
