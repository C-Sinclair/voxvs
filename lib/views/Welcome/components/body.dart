import 'package:flutter/material.dart';
import 'package:voxvs/constants.dart';
import 'package:voxvs/views/Login/login_screen.dart';
import 'package:voxvs/components/background.dart';
import 'package:voxvs/components/rounded_button.dart';
import 'package:voxvs/views/Signup/signup_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      logo: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "voxvs welcomes you",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Column(
            children: <Widget>[
              RoundedButton(
                text: "LOGIN",
                onpress: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ),
              ),
              SizedBox(height: 10),
              RoundedButton(
                text: "SIGN UP",
                onpress: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                ),
                colour: Colours.fifthary,
              ),
            ],
          )
        ],
      ),
    );
  }
}
