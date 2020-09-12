import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool logo;
  const Background({
    Key key,
    @required this.child,
    this.logo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: size.height / 8,
              child: new RotatedBox(
                quarterTurns: 2,
                child: Image.asset("assets/images/triangle-euclid.png",
                    width: size.width / 3),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "assets/images/purple-triangles.png",
                    width: size.width,
                    // height: size.height,
                  )),
            ),
            child
          ],
        ));
  }
}
