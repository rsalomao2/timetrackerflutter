import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/LandingPage.dart';
import 'package:flutter_application_1/app/provider/AuthProvider.dart';
import 'package:flutter_application_1/service/Auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: "Time Tracker",
        theme: ThemeData(primaryColor: Colors.indigo),
        home: LandingPage(),
      ),
    );
  }
}
