import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/data/i_auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/features/auth/model/user_model.dart';

class AuthServices implements IAuthServices {
  AuthServices._();
  static final instance = AuthServices._();
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<UserCredential> loginUser(String email, String password) async =>
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

  @override
  Future<void> registerWithFireStore(
    String email,
    String name,
    String image,
    String id,
  ) async {
    Map<String, dynamic> user = UserModel(
      email: email,
      image: image,
      name: name,
      uId: id,
    ).toMap();
    await _fireStore.doc("users").set(user);
  }

  @override
  Future<UserCredential> registerWithEmail(
          String email, String password) async =>
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
}
/*
  * invalid-email:
  * user-disabled:
  * user-not-found:
  * wrong-password:
 */