import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin/widget/ButtonForm.dart';
import 'package:flutter_application_1/service/Auth.dart';

class SignUpForm extends StatefulWidget {
  final AuthBase _auth;

  const SignUpForm(this._auth);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passowrdFocusNode = FocusNode();
  EmailSignInType _currentFormtype = EmailSignInType.SIGN_IN;
  String get _email => _emailTextController.text;
  String get _password => _passwordTextController.text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildInputFildsForm(),
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  List<Widget> _buildInputFildsForm() {
    final String _primaryButtonText =
        _currentFormtype == EmailSignInType.SIGN_IN ? "Sign In" : "Sign Up";

    final String _secondaryButtonText =
        _currentFormtype == EmailSignInType.SIGN_IN
            ? "Need am account? Register"
            : "Already ha an account? Sing In";

    return [
      _buildEmailtTextField(),
      SizedBox(
        height: 12,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 12,
      ),
      ButtonForm(
        label: _primaryButtonText,
        onClick: () => _onPrimaryButtonClick(),
      ),
      SizedBox(
        height: 12,
      ),
      TextButton(
          onPressed: _toggleSiginType,
          child: Text(
            _secondaryButtonText,
            style: TextStyle(
              fontSize: 16,
            ),
          ))
    ];
  }

  TextField _buildPasswordTextField() {
    return TextField(
      controller: _passwordTextController,
      decoration: InputDecoration(
        hintText: "*****",
        labelText: "Password",
      ),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onEditingComplete: _onPasswordEditingComplete,
      focusNode: _passowrdFocusNode,
    );
  }

  TextField _buildEmailtTextField() {
    return TextField(
      controller: _emailTextController,
      decoration: InputDecoration(
        hintText: "email@email.com",
        labelText: "Email",
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onEditingComplete: _emailEditingComplete,
    );
  }

  void _onPrimaryButtonClick() async {
    print("email: ${_emailTextController.text}");
    print("email: ${_passwordTextController.text}");
    try {
      User? user;
      if (_currentFormtype == EmailSignInType.SIGN_IN)
        user = await widget._auth.singInEmail(_email, _password);
      else
        user = await widget._auth
            .createUserWithEmailAndPassword(_email, _password);

      print("SIGN IN SUCCESS: $user");
      Navigator.of(context).pop();
    } catch (e) {
      print("SIGN IN FAILURE: $e");
    }
  }

  void _toggleSiginType() {
    setState(() {
      _currentFormtype = _currentFormtype == EmailSignInType.SIGN_IN
          ? EmailSignInType.SIGN_UP
          : EmailSignInType.SIGN_IN;
    });
    _emailTextController.clear();
    _passwordTextController.clear();
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passowrdFocusNode);
  }

  void _onPasswordEditingComplete() {
    _onPrimaryButtonClick();
  }
}

enum EmailSignInType { SIGN_IN, SIGN_UP }
