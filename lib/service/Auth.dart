import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User? get currentUser;
  Future<User?> singInAnonymously();
  Future<User?> signInGoogle();
  Future<User?> signInFacebook();
  Future<void> signOut();
  Stream<User?> authStateChanges();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  static const String USER_CANCEL_LOGIN = "USER_CANCEL_LOGIN";
  static const String CODE_LOGIN_FACEBOOK = "LOGIN_FACEBOOK";
  static const String CODE_LOGIN_GMAIL = "LOGIN_GMAIL";

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> singInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
    _signOutGoogle();
  }

  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<User?> signInGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAutentication = await googleUser.authentication;
      final googleToken = googleAutentication.idToken;
      if (googleToken != null) {
        final userCredential = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAutentication.idToken,
          accessToken: googleAutentication.accessToken,
        ));
        return userCredential.user;
      } else {
        return throw FirebaseAuthException(
          code: "Code: ${googleAutentication.serverAuthCode}",
          message: "No token",
        );
      }
    } else {
      return throw FirebaseAuthException(
        code: "Code: No code",
        message: "No User",
      );
    }
  }

  Future<void> _signOutGoogle() async {
    final googleSignin = GoogleSignIn();
    googleSignin.signOut();
  }

  @override
  Future<User?> signInFacebook() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final credential = FacebookAuthProvider.credential(accessToken.token);
        final firebaseCredential =
            await _firebaseAuth.signInWithCredential(credential);
        return firebaseCredential.user;
      case FacebookLoginStatus.cancelledByUser:
        FirebaseAuthException(code: CODE_LOGIN_FACEBOOK);
        break;
      case FacebookLoginStatus.error:
        FirebaseAuthException(
          code: CODE_LOGIN_FACEBOOK,
          message: 'Something went wrong with the login process.\n'
              'Here\'s the error Facebook gave us: ${result.errorMessage}',
        );
        break;
    }
  }
}
