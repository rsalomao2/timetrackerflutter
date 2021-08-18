import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin/CustomButtonForm.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm();

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  EmailSignInType _currentFormtype = EmailSignInType.SIGN_IN;

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
      TextField(
        controller: _emailTextController,
        decoration: InputDecoration(
          hintText: "email@email.com",
          labelText: "Email",
        ),
      ),
      SizedBox(
        height: 12,
      ),
      TextField(
        controller: _passwordTextController,
        decoration: InputDecoration(
          hintText: "*****",
          labelText: "Password",
        ),
        obscureText: true,
      ),
      SizedBox(
        height: 12,
      ),
      CustomButtonForm(
        label: _primaryButtonText,
        onClick: () => _signInEmail(),
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

  void _signInEmail() {
    print("email: ${_emailTextController.text}");
    print("email: ${_passwordTextController.text}");
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
}

enum EmailSignInType { SIGN_IN, SIGN_UP }
