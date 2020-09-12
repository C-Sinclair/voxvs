import 'package:flutter/material.dart';
import 'components/body.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(size: size),
    );
  }
}
