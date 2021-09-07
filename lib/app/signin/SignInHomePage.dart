import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin/SignInEmailPage.dart';
import 'package:flutter_application_1/app/signin/SigninBloc.dart';
import 'package:flutter_application_1/app/signin/widget/SignInButton.dart';
import 'package:flutter_application_1/app/signin/widget/SignInImageButton.dart';
import 'package:flutter_application_1/commonwidget/AlertDialogHelper.dart';
import 'package:flutter_application_1/commonwidget/CustomToolBar.dart';
import 'package:flutter_application_1/service/Auth.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final SignInBloc bloc;

  const SignInPage({Key? key, required this.bloc}) : super(key: key);

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Provider<SignInBloc>(
        create: (_) => SignInBloc(auth),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<SignInBloc>(
            builder: (_, bloc, __) => SignInPage(bloc: bloc)));
  }

  @override
  Widget build(BuildContext context) {
    return CustomToolBar(
        "Time Tracker",
        StreamBuilder<bool>(
            stream: bloc.isLoading,
            initialData: false,
            builder: (context, snapshot) {
              return _getBody(context, snapshot.data!);
            }));
  }

  Widget _getBody(BuildContext context, bool isLoading) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
            child: _buildHeader(isLoading),
          ),
          SizedBox(height: 48),
          SignInImageButton(
            text: "Sign in with Google",
            textColor: Colors.black87,
            imagePath: "assets/images/google-logo.png",
            backgroundColor: Colors.white70,
            onClickListener: isLoading ? null : () => bloc.signInGoogle(),
          ),
          SizedBox(height: 8),
          SignInImageButton(
            text: "Sign in with Facebook",
            textColor: Colors.white,
            imagePath: "assets/images/facebook-logo.png",
            backgroundColor: Color(0xFF334D92),
            onClickListener: isLoading ? null : () => bloc.signInFacebook(),
          ),
          SizedBox(height: 8),
          SignInButton(
            text: "Sign in with Email",
            textColor: Colors.white,
            backgroundColor: Colors.teal,
            onClickListener: isLoading ? null : () => _signInEmail(context),
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
            onClickListener: isLoading ? null : () => bloc.signInAnonymously(),
          ),
        ],
      ),
    );
  }

  void _signInEmail(BuildContext context) {
    print("click");
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          fullscreenDialog: true, builder: (context) => SignInEmailPage()),
    );
  }

  void _showErrorAlert(
    BuildContext context,
    FirebaseException firebaseException,
  ) {
    final title = "Sigin Failure";
    final message = firebaseException.message != null
        ? firebaseException.message!
        : "Unable to perform your Signin";
    if (firebaseException.code != "ERROR_ABORTED_BY_USER")
      showCustomAlertDialog(
        context: context,
        title: title,
        content: message,
      );
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading)
      return Center(child: CircularProgressIndicator());
    else
      return Text(
        "Sign In",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
      );
  }
}
