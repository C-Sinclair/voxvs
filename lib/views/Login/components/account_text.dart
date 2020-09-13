import 'package:flutter/material.dart';
import 'package:voxvs/views/Login/login_screen.dart';
import 'package:voxvs/views/Signup/signup_screen.dart';

class AccountText extends StatelessWidget {
  final bool isLogin;

  const AccountText({Key key, this.isLogin = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            isLogin ? "Don't have an account?" : "Already have an account?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      isLogin ? SignupScreen() : LoginScreen()),
            ),
            child: Text(
              isLogin ? "Sign up" : "Log in",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
