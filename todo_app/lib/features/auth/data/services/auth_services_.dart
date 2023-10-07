import 'package:todo_app/features/auth/data/interfaces/i_auth_services.dart';
import 'package:todo_app/features/auth/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices implements IAuthServices {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel(
      email: response.user?.email,
      name: response.user?.displayName,
      image: response.user?.photoURL,
    );
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn()
        .signIn(); //! get Data of account |> googleUser.email
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication; //! list of google Accounts

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    ); //! To connect googleAccount with firebase
    await _firebaseAuth.signInWithCredential(credential);
    
    return UserModel(
      email: googleUser.email,
      image: googleUser.photoUrl,
      name: googleUser.displayName,
    );
  }

  @override
  Future<UserModel> register(String email, String password) async {
    final response = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel(
      email: response.user?.email,
      name: response.user?.displayName,
      image: response.user?.photoURL,
    );
  }

  @override
  Future<bool> signOut() async {
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().signOut();
    }
    await _firebaseAuth.signOut();
    return true;
  }

  @override
  Future<bool> forgetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return true;
  }
}
