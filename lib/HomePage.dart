import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/Auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.auth});

  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          TextButton(
            onPressed: _signOut,
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
}
