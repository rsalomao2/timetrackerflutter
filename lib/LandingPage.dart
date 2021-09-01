import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/app/provider/AuthProvider.dart';
import 'package:flutter_application_1/app/signin/SignInHomePage.dart';

class LandingPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null)
            return SignInPage(auth: auth);
          else
            return HomePage(context: context, auth: auth);
        } else
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
      },
    );
  }
}
