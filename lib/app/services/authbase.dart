import 'package:firebase_auth/firebase_auth.dart';
abstract class AuthBase{
  Stream<User?> authStateChanges();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}