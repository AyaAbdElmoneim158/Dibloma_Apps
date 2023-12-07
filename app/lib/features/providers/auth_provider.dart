import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/core/helper/handel_firebase_error_code.dart';
import '/features/services/auth_services/auth_services_.dart';
import '/features/services/auth_services/i_auth_services.dart';
import 'package:uuid/uuid.dart';

enum AuthStatus {
  initState,
  userUnAuthorized,
  userAuthorized,
  loginSuccessState,
  loginErrorState,
  loginLoadingState,
  registerWithEmailSuccessState,
  registerWithEmailErrorState,
  registerWithEmailLoadingState,
  registerWithFireStoreSuccessState,
  registerWithFireStoreErrorState,
  registerWithFireStoreLoadingState,
}

class AuthProvide with ChangeNotifier {
  final IAuthServices service = AuthServices.instance;
  late User _user;
  late AuthStatus _authStatus;
  late String errorMsg;

  User get user => _user;
  AuthStatus get authStatus => _authStatus;

  AuthProvide() {
    _authStatus = AuthStatus.initState;
    errorMsg = '___________________________';
    checkUser();
  }
  void checkUser() {
    service.authStateChanges().listen((User? user) {
      if (user == null) {
        _authStatus = AuthStatus.userUnAuthorized;
      } else {
        _user = user;
        _authStatus = AuthStatus.userAuthorized;
      }
      notifyListeners();
    });
  }

  Future<bool> login(String email, String password) async {
    try {
      _authStatus = AuthStatus.loginLoadingState;
      debugPrint("AuthStatus\t ${AuthStatus.loginLoadingState}");
      UserCredential value = await service.loginUser(email, password);
      _user = value.user!;
      _authStatus = AuthStatus.loginSuccessState;
      debugPrint("AuthStatus\t ${AuthStatus.loginSuccessState}");
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (error) {
      errorMsg = HandelFirebaseErrorCode.getMessageFromErrorCode(
          errorCode: error.code);
      _authStatus = AuthStatus.loginErrorState;
      debugPrint("AuthStatus\t ${AuthStatus.loginErrorState}\t${error.code}");
      notifyListeners();
      return false;
    } catch (error) {
      errorMsg = error.toString();
      _authStatus = AuthStatus.loginErrorState;
      debugPrint("AuthStatus\t ${AuthStatus.loginErrorState}\t $error");
      notifyListeners();
      return false;
    }
  }

  Future<bool> registerWithEmail(String email, String password) async {
    try {
      _authStatus = AuthStatus.registerWithEmailLoadingState;
      debugPrint("AuthStatus\t ${AuthStatus.registerWithEmailLoadingState}");
      UserCredential value = await service.registerWithEmail(email, password);
      _user = value.user!;
      _authStatus = AuthStatus.registerWithEmailSuccessState;
      debugPrint("AuthStatus\t ${AuthStatus.registerWithEmailSuccessState}");
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (error) {
      errorMsg = HandelFirebaseErrorCode.getMessageFromErrorCode(
          errorCode: error.code);
      _authStatus = AuthStatus.registerWithEmailErrorState;
      debugPrint(
          "AuthStatus\t ${AuthStatus.registerWithEmailErrorState}\t${error.code}");
      notifyListeners();
      return false;
    } catch (error) {
      errorMsg = error.toString();
      _authStatus = AuthStatus.registerWithEmailErrorState;
      debugPrint(
          "AuthStatus\t ${AuthStatus.registerWithEmailErrorState}\t $error");
      notifyListeners();
      return false;
    }
  }

  Future<bool> registerWithFireStore(
      String email, String name, String image, String id) async {
    try {
      _authStatus = AuthStatus.registerWithFireStoreLoadingState;
      debugPrint(
          "AuthStatus\t ${AuthStatus.registerWithFireStoreLoadingState}");
      await service.registerWithFireStore(
          email, name, image, Uuid.NAMESPACE_DNS);
      checkUser();
      _authStatus = AuthStatus.registerWithFireStoreSuccessState;
      debugPrint(
          "AuthStatus\t ${AuthStatus.registerWithFireStoreSuccessState}");
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (error) {
      errorMsg = HandelFirebaseErrorCode.getMessageFromErrorCode(
          errorCode: error.code);
      _authStatus = AuthStatus.registerWithFireStoreErrorState;
      debugPrint(
          "AuthStatus\t ${AuthStatus.registerWithFireStoreErrorState}\t${error.code}");
      notifyListeners();
      return false;
    } catch (error) {
      errorMsg = error.toString();
      _authStatus = AuthStatus.registerWithFireStoreErrorState;
      debugPrint(
          "AuthStatus\t ${AuthStatus.registerWithFireStoreErrorState}\t $error");
      notifyListeners();
      return false;
    }
  }
}
  
//   Future<void> loginUser(String email, String password) async {
//     _authStatus = AuthStatus.userLoading;

//     await service.loginWithEmailAndPassword(email, password).then((value) {
//       debugPrint("At Then");

//       _authStatus = AuthStatus.userAuthorized;
//       _user = user;
//     }).catchError((error) {
//       debugPrint("At catchError");

//       errorMsg = getMsg(error);
//       _authStatus = AuthStatus.userError;
//     });
//     notifyListeners();
//   }

// //todo: at helperFile
//   String getMsg(err) {
//     // Todo: https://medium.com/flutter-community/firebase-auth-exceptions-handling-flutter-54ab59c2853d
//     switch (err.code) {
//       case "ERROR_EMAIL_ALREADY_IN_USE":
//       case "account-exists-with-different-credential":
//       case "email-already-in-use":
//         return "Email already used. Go to login page.";
//       case "ERROR_WRONG_PASSWORD":
//       case "wrong-password":
//         return "Wrong email/password combination.";
//       case "ERROR_USER_NOT_FOUND":
//       case "user-not-found":
//         return "No user found with this email.";
//       case "ERROR_USER_DISABLED":
//       case "user-disabled":
//         return "User disabled.";
//       case "ERROR_TOO_MANY_REQUESTS":
//       case "operation-not-allowed":
//         return "Too many requests to log into this account.";
//       case "ERROR_OPERATION_NOT_ALLOWED":
//         return "Server error, please try again later.";
//       case "ERROR_INVALID_EMAIL":
//       case "invalid-email":
//         return "Email address is invalid.";
//       default:
//         return "Login failed. Please try again.";
//     }
//   }

// //**************************************************
//   void loginWithEmail(String email, String password) async {
//     _authStatus = AuthStatus.userLoading;
//     try {
//       await _authHelper.loginWithEmailAndPassword(email, password);
//       _authStatus = AuthStatus.userAuthorized;
//     } catch (e) {
//       errorMsg = getMsg(e);
//       _authStatus = AuthStatus.userError;
//       debugPrint(e.toString());
//     }
//     notifyListeners();
//   }

//   Future<void> registerWithEmail(
//       String email, String password, String userName) async {
//     // auth + firebase ...
//     _authStatus = AuthStatus.userLoading;
//     debugPrint('1');
//     _authHelper.signUpWithEmailAndPassword(email, password).then((value) async {
//       await _firestoreHelper.setData(
//         path: 'users/${value!.uid}',
//         data: UserModel(
//           email: email,
//           name: userName,
//           uId: value.uid,
//         ).toMap(),
//       );
//       await FirebaseAuth.instance.currentUser?.updateDisplayName(userName);
//       debugPrint('2');

//       debugPrint(
//           "Register Email Success ....! ${value.email} :: ${value.uid} :: ${value.displayName}");
//       _authStatus = AuthStatus.userAuthorized;
//     }).catchError((err) {
//       debugPrint("Register Email Error ....! $err");
//       errorMsg = getMsg(err);
//       _authStatus = AuthStatus.userError;
//     });
//     notifyListeners();
//   }

//   Future<void> logout() async {
//     await _authHelper.logout();
//     _authStatus = AuthStatus.userUnAuthorized;
//     notifyListeners();
//   }
// }
