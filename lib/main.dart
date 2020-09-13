import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voxvs/views/Error/error_screen.dart';
import 'package:voxvs/views/Home/home_screen.dart';
import 'package:voxvs/views/Loading/loading_screen.dart';
import 'package:voxvs/views/Welcome/welcome_screen.dart';
import 'package:voxvs/constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voxvs',
      theme: ThemeData(
          primaryColor: Colours.primary,
          scaffoldBackgroundColor: Colors.transparent),
      home: Initializer(),
    );
  }
}

class Initializer extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return FirebaseAuth.instance.currentUser != null
              ? HomeScreen()
              : WelcomeScreen();
        }
        return LoadingScreen();
      },
    );
  }
}
