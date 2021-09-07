import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/service/Auth.dart';

class SignInBloc {
  StreamController<bool> _isLoadingStream = StreamController<bool>();
  final AuthBase auth;

  SignInBloc(this.auth);

  Stream<bool> get isLoading => _isLoadingStream.stream;

  void dispose() {
    _isLoadingStream.close();
  }

  void setIsLoadingStream(bool isLoading) => _isLoadingStream.add(isLoading);

  Future<User?> signInAnonymously() async =>
      _sigIn(() => auth.singInAnonymously());

  Future<User?> signInGoogle() async => _sigIn(() => auth.signInGoogle());

  Future<User?> signInFacebook() async => _sigIn(() => auth.signInFacebook());

  Future<User?> _sigIn(Future<User?> Function() sigInMethod) async {
    try {
      setIsLoadingStream(true);
      return await sigInMethod.call();
    } catch (e) {
      setIsLoadingStream(false);
      rethrow;
    }
  }
}
