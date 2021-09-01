import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/Auth.dart';

class AuthProvider extends InheritedWidget {
  final AuthBase auth;
  final Widget child;
  AuthProvider({required this.auth, required this.child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AuthBase of(BuildContext context) {
    AuthProvider authProvider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>()!;
    return authProvider.auth;
  }
}
