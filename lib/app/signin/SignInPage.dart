import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin/SignInImageButton.dart';
import 'package:flutter_application_1/app/signin/signinbutton.dart';
import 'package:flutter_application_1/service/Auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({required this.onSignIn, required this.auth});

  final Auth auth;
  final void Function(User?) onSignIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Time Tracker"),
      ),
      body: _getBody(),
    );
  }

  Future<void> _signInAnonymously() async {
    try {
      final user = await auth.singInAnonymously();
      onSignIn(user);
      print("Signing SUCESS");
    } catch (e) {
      print(e.toString());
      print("Signing Failure");
    }
  }

  Widget _getBody() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 48),
          SignInImageButton(
            text: "Sign in with Google",
            textColor: Colors.black87,
            imagePath: "assets/images/google-logo.png",
            backgroundColor: Colors.white70,
            onClickListener: () {},
          ),
          SizedBox(height: 8),
          SignInImageButton(
            text: "Sign in with Facebook",
            textColor: Colors.white,
            imagePath: "assets/images/facebook-logo.png",
            backgroundColor: Color(0xFF334D92),
            onClickListener: () {},
          ),
          SizedBox(height: 8),
          SignInButton(
            text: "Sign in with Email",
            textColor: Colors.white,
            backgroundColor: Colors.teal,
            onClickListener: () {},
          ),
          SizedBox(height: 8),
          Text(
            "Or",
            style: TextStyle(color: Colors.black87, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          SignInButton(
            text: "Go anonymous",
            textColor: Colors.white,
            backgroundColor: Colors.lime,
            onClickListener: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
