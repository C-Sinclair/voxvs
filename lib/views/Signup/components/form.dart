import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voxvs/components/controlled_textfield.dart';
import 'package:voxvs/components/rounded_button.dart';
import 'package:voxvs/constants.dart';
import 'package:voxvs/views/Home/home_screen.dart';
import 'package:voxvs/views/Login/components/account_text.dart';

class SignupNoUserError extends Error {}

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key key,
  }) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _signup() async {
    try {
      String email = _emailController.text;
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: _passwordController.text,
      );
      final User user = credential.user;
      if (user != null) {
        String uid = user.uid;
        FirebaseFirestore.instance.collection("accounts").add({
          "uid": uid,
          "email": email,
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        throw SignupNoUserError();
      }
    } on SignupNoUserError {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Signup failed")));
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
            controller: _confirmEmailController,
            labelText: "Confirm Email",
            hintText: "Confirm your email",
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              if (value != _emailController.text) {
                return "Emails don't match";
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
          ControlledTextField(
            controller: _confirmPasswordController,
            labelText: "Confirm Password",
            hintText: "Confirm your password",
            icon: Icons.lock,
            password: true,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              if (value != _passwordController.text) {
                return "Passwords don't match";
              }
              return null;
            },
          ),
          RoundedButton(
            text: "SIGN UP",
            colour: Colours.fifthary,
            onpress: () async {
              if (_formKey.currentState.validate()) {
                _signup();
              }
            },
          ),
          AccountText(isLogin: false)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _confirmEmailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
