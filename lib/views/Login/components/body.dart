import 'package:flutter/material.dart';
import 'package:voxvs/components/rounded_button.dart';
import 'package:voxvs/components/background.dart';
import 'package:voxvs/components/rounded_textfield.dart';
import 'package:voxvs/views/Login/components/account_text.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Container(
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedTextField(
            hintText: "Email",
            onChanged: (value) {},
          ),
          RoundedTextField(
              hintText: "Password",
              icon: Icons.lock,
              onChanged: (value) {},
              password: true),
          RoundedButton(
            text: "LOGIN",
            onpress: () {},
          ),
          AccountText()
        ],
      ),
    ));
  }
}
