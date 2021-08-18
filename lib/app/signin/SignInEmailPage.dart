import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin/SignInForm.dart';
import 'package:flutter_application_1/commonwidget/CustomToolBar.dart';

class SignInEmailPage extends StatefulWidget {
  const SignInEmailPage();

  @override
  _SignInEmailPageState createState() => _SignInEmailPageState();
}

class _SignInEmailPageState extends State<SignInEmailPage> {
  @override
  Widget build(BuildContext context) {
    return CustomToolBar("Sign In", _getContent());
  }

  Widget _getContent() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        child: SignUpForm(),
      ),
    );
  }
}
