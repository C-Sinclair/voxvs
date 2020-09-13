import 'package:flutter/material.dart';
import 'package:voxvs/components/logo.dart';
import 'package:voxvs/components/sound_waves.dart';

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
            if (logo)
              Positioned(
                top: size.height / 8,
                child: Logo(width: size.width / 3),
              ),
            // Positioned(
            //   bottom: -100,
            //   left: 0,
            //   child: Image.asset(
            //     "assets/images/purple-triangles.png",
            //     width: size.width,
            //     // height: size.height,
            //   ),
            // ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Waves(),
            ),

            child
          ],
        ));
  }
}
