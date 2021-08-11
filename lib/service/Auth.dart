import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User? get currentUser;
  Future<User?> singInAnonymously();
  Future<User?> signInGoogle();
  Future<void> signOut();
  Stream<User?> authStateChanges();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

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
        final userCredential =
            await _firebaseAuth.signInWithCustomToken(googleToken);
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
}
