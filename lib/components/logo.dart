import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;

  const Logo({
    Key key,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: Image.asset("assets/images/triangle-euclid.png", width: width),
    );
  }
}
