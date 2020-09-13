import 'package:flutter/material.dart';
import 'package:voxvs/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      logo: false,
      child: Text("Home"),
    );
  }
}
