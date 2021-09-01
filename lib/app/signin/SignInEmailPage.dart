import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin/widget/SignInForm.dart';
import 'package:flutter_application_1/commonwidget/CustomToolBar.dart';

class SignInEmailPage extends StatefulWidget {
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
          child: EmailSignUpForm(),
        ),
      ),
    );
  }
}
