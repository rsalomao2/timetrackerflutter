import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin/widget/SignInForm.dart';
import 'package:flutter_application_1/commonwidget/CustomToolBar.dart';
import 'package:flutter_application_1/service/Auth.dart';

class SignInEmailPage extends StatefulWidget {
  final AuthBase auth;
  const SignInEmailPage(this.auth);

  @override
  _SignInEmailPageState createState() => _SignInEmailPageState();
}

class _SignInEmailPageState extends State<SignInEmailPage> {
  @override
  Widget build(BuildContext context) {
    return CustomToolBar("Sign In", _getContent());
  }

  Widget _getContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          child: EmailSignUpForm(widget.auth),
        ),
      ),
    );
  }
}
