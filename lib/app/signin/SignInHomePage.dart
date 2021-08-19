import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin/SignInEmailPage.dart';
import 'package:flutter_application_1/app/signin/signinbutton.dart';
import 'package:flutter_application_1/app/signin/widget/SignInImageButton.dart';
import 'package:flutter_application_1/commonwidget/CustomToolBar.dart';
import 'package:flutter_application_1/service/Auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({required this.auth});

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return CustomToolBar("Time Tracker", _getBody(context));
  }

  Widget _getBody(BuildContext context) {
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
            onClickListener: _signInGoogle,
          ),
          SizedBox(height: 8),
          SignInImageButton(
            text: "Sign in with Facebook",
            textColor: Colors.white,
            imagePath: "assets/images/facebook-logo.png",
            backgroundColor: Color(0xFF334D92),
            onClickListener: _signInFacebook,
          ),
          SizedBox(height: 8),
          SignInButton(
            text: "Sign in with Email",
            textColor: Colors.white,
            backgroundColor: Colors.teal,
            onClickListener: () => _signInEmail(context),
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

  Future<void> _signInAnonymously() async {
    try {
      await auth.singInAnonymously();
      print("Signing SUCESS");
    } catch (e) {
      print(e.toString());
      print("Signing Failure");
    }
  }

  Future<void> _signInGoogle() async {
    try {
      auth.signInGoogle();
      print("Signing Google SUCESS");
    } catch (e) {
      print(e);
      print("Signing Google Failure");
    }
  }

  Future<void> _signInFacebook() async {
    try {
      auth.signInFacebook();
      print("Signing Facebook SUCESS");
    } catch (e) {
      print(e);
      print("Signing Facebook Failure");
    }
  }

  void _signInEmail(BuildContext context) {
    print("click");
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          fullscreenDialog: true, builder: (context) => SignInEmailPage(auth)),
    );
  }
}
