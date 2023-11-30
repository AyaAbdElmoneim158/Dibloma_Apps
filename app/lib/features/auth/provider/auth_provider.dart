import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/auth_helper.dart';
import 'package:todo_app/core/helper/firestore_helper.dart';
import 'package:todo_app/core/model/user_model.dart';

enum AuthStatus { unAuthenticated, authenticated, authenticating }

class AuthProvide with ChangeNotifier {
  late AuthStatus _authStatus;
  late FirebaseAuth _auth;
  late AuthHelper _authHelper;
  late FirestoreHelper _firestoreHelper;
  var whoUser = AuthHelper.instance.currentUser;
  late User _user;
  late String errorMsg;

  User get user => _user;
  AuthStatus get authStatus => _authStatus;

  AuthProvide() {
    _authStatus = AuthStatus.unAuthenticated;
    _auth = FirebaseAuth.instance;
    _authHelper = AuthHelper.instance;
    _firestoreHelper = FirestoreHelper.instance;
    errorMsg = 'default';

    _auth.authStateChanges().listen((user) {
      if (user == null) {
        _authStatus = AuthStatus.unAuthenticated;
      } else {
        _user = user;
        _authStatus = AuthStatus.authenticated;
      }
      notifyListeners();
    });
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      _authStatus = AuthStatus.authenticating;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _authStatus = AuthStatus.authenticated;
      _user = userCredential.user!;

      notifyListeners(); // debugPrint('At try: $errorMsg');
      return true;
    } on FirebaseAuthException catch (error) {
      getMsg(error);
      debugPrint(
          'At FirebaseAuthException catch: $errorMsg .... ${error.code}');
    } catch (e) {
      errorMsg = e.toString();
      debugPrint('At catch: $errorMsg');
    }

    _authStatus = AuthStatus.unAuthenticated;
    notifyListeners();
    return false;
  }

  Future<bool> signUpUser(String email, String password) async {
    try {
      _authStatus = AuthStatus.authenticating;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _authStatus = AuthStatus.authenticated;
      _user = userCredential.user!;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (err) {
      getMsg(err);
    } catch (e) {
      errorMsg = e.toString();
    }
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    await _auth.signOut();
    _authStatus = AuthStatus.unAuthenticated;
    notifyListeners();
  }

  String getMsg(err) {
    // Todo: https://medium.com/flutter-community/firebase-auth-exceptions-handling-flutter-54ab59c2853d
    /*switch (err.code) {
      case 'invalid-login-credentials':
        errorMsg = 'invalid-login-credentials';
        break;
      case 'user-not_found':
        errorMsg = 'user-not_found';
        break;
      case 'wrong_password':
        errorMsg = 'wrong_password';
        break;
      default:
        errorMsg = 'Error..!';
    }*/
    // if (err.code == 'invalid-email') {
    //   errorMsg = "Your email is invalid";
    //   debugPrint('Invalid email');
    // }
    // if (err.code == 'user-not-found') {
    //   errorMsg = "User not found";
    //   debugPrint('Hi, User not found');
    // } else if (err.code == 'wrong-password') {
    //   errorMsg = "Your password is not correct";
    // } else if (err.code == 'invalid-login-credentials') {
    //   errorMsg = "invalid-login-credentials";
    // }
    switch (err.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server error, please try again later.";
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";

      default:
        return "Login failed. Please try again.";
    }
  }

//**************************************************
  void loginWithEmail(String email, String password) {
    _authStatus = AuthStatus.authenticating;
    _authHelper.loginWithEmailAndPassword(email, password).then((value) async {
      debugPrint("login Success ....! :: $value");
      _authStatus = AuthStatus.authenticated;
    }).catchError((err) {
      debugPrint("login Error ....!");
      getMsg(err);
      _authStatus = AuthStatus.unAuthenticated;
    });
  }

  void registerWithEmail(String email, String password, String userName) {
    // auth + firebase ...
    _authStatus = AuthStatus.authenticating;
    debugPrint('1');
    _authHelper.signUpWithEmailAndPassword(email, password).then((value) async {
      await _firestoreHelper.setData(
        path: 'users/${value!.uid}',
        data: UserModel(
          email: email,
          name: userName,
          uId: value.uid,
        ).toMap(),
      );
      await FirebaseAuth.instance.currentUser?.updateDisplayName(userName);
      debugPrint('2');

      debugPrint(
          "Register Email Success ....! ${value.email} :: ${value.uid} :: ${value.displayName}");
      _authStatus = AuthStatus.authenticated;
    }).catchError((err) {
      debugPrint("Register Email Error ....! $err");
      getMsg(err);
      _authStatus = AuthStatus.unAuthenticated;
    });
  }
}
