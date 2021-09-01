import 'package:flutter/material.dart';
import 'package:flutter_application_1/commonwidget/AlertDialogHelper.dart';
import 'package:flutter_application_1/service/Auth.dart';

class HomePage extends StatelessWidget {
  final BuildContext context;
  const HomePage({
    required this.context,
    required this.auth,
  });

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          TextButton(
            onPressed: _showSingoutConfirmation,
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSingoutConfirmation() {
    showCustomAlertDialog(
        negativeActionLabel: "Cancel",
        onPositiveAction: _signOut,
        context: context,
        title: "Sign out",
        content: "Are you sure do you want signout from app",
        positiveActionLabel: "Yes");
  }

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
