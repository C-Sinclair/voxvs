import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voxvs/components/controlled_textfield.dart';
import 'package:voxvs/components/rounded_button.dart';
import 'package:voxvs/views/Home/home_screen.dart';
import 'package:voxvs/views/Login/components/account_text.dart';

class LoginNoUserError extends Error {}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final User user = credential.user;
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        throw LoginNoUserError();
      }
    } on LoginNoUserError {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Login failed")));
    } catch (err) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ControlledTextField(
            controller: _emailController,
            labelText: "Email",
            hintText: "Enter your email",
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          ControlledTextField(
            controller: _passwordController,
            labelText: "Password",
            hintText: "Enter your password",
            icon: Icons.lock,
            password: true,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          RoundedButton(
            text: "LOGIN",
            onpress: () async {
              if (_formKey.currentState.validate()) {
                _login();
              }
            },
          ),
          AccountText()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
