import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthServices {
  const IAuthServices();

  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<UserCredential> loginUser(String email, String password);
  Future<UserCredential> registerWithEmail(String email, String password);
  Future<void> registerWithFireStore(
      String email, String name, String image, String id);

  // Future<User?> signUpWithEmailAndPassword(String email, String password);
  // Future<void> logout();
  // Future<UserCredential> signInWithGoogle();
  // Future<UserCredential> signInWithFacebook();
  // Future<void> passwordReset(String email);
  // Future<void> verifyPhoneNum(String? phoneNumber, String? verify);
}
