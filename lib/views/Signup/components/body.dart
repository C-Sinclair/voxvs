import 'package:flutter/material.dart';
import 'package:voxvs/components/background.dart';
import 'package:voxvs/views/Signup/components/form.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Background(
        logo: true,
        child: Container(
            width: size.width, height: size.height, child: SignupForm()));
  }
}
