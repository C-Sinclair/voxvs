import 'package:flutter/material.dart';
import 'package:voxvs/components/logo.dart';
import 'package:voxvs/components/sound_waves.dart';
import 'package:voxvs/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool logo;
  final bool waves;

  const Background({
    Key key,
    @required this.child,
    this.logo = false,
    this.waves = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          stops: [0.1, 1.0],
          colors: [
            Colours.thirdary.withOpacity(0.3),
            Colours.thirdary.withOpacity(0.5),
          ],
        )),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            if (logo)
              Positioned(
                top: size.height / 8,
                child: Logo(width: size.width / 3),
              ),
            if (waves)
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
