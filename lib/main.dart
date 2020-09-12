import 'package:flutter/material.dart';
import 'package:voxvs/views/Welcome/welcome_screen.dart';
import 'package:voxvs/constants.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voxvs',
      theme: ThemeData(
          primaryColor: Colours.primary, scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
    );
  }
}
