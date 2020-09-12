import 'package:flutter/material.dart';
import 'package:voxvs/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onpress;
  final Color colour;

  const RoundedButton({
    Key key,
    this.text,
    this.onpress,
    this.colour = Colours.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 2,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: colour,
              onPressed: onpress,
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ))),
    );
  }
}
