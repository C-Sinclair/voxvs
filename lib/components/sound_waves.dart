import 'dart:async';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

class Vibes {
  final double height;
  final Color colour;

  Vibes(this.height, this.colour);

  Vibes get collapsed => Vibes(0.0, colour);

  static Vibes lerp(Vibes begin, Vibes end, double t) {
    return Vibes(
      lerpDouble(begin.height, end.height, t),
      Color.lerp(begin.colour, end.colour, t),
    );
  }
}

class Wave {
  final List<Vibes> wave;

  Wave(this.wave);

  factory Wave.empty(Size size) {
    return Wave(<Vibes>[]);
  }

  factory Wave.random(Size size, Random random) {
    final waveLength = 150;
    final colour = Colors.yellow
        // Colours.secondary
        .withBlue(random.nextInt(255))
        .withRed(random.nextInt(255))
        .withGreen(random.nextInt(255));
    final bars = List.generate(
      waveLength,
      (index) => Vibes(random.nextDouble(), colour),
    );
    return Wave(bars);
  }

  static Wave lerp(Wave begin, Wave end, double t) {
    final waveLength = max(begin.wave.length, end.wave.length);
    final waves = List.generate(
      waveLength,
      (i) => Vibes.lerp(
        begin._getWaves(i) ?? end.wave[i].collapsed,
        end._getWaves(i) ?? begin.wave[i].collapsed,
        t,
      ),
    );
    return Wave(waves);
  }

  Vibes _getWaves(int index) => (index < wave.length ? wave[index] : null);
}

class VibesTween extends Tween<Wave> {
  VibesTween(Wave begin, Wave end) : super(begin: begin, end: end);

  @override
  Wave lerp(double t) => Wave.lerp(begin, end, t);
}

class WavesPainter extends CustomPainter {
  final Animation<Wave> animation;

  WavesPainter(Animation<Wave> animation)
      : animation = animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    canvas.translate(0, size.height);
    canvas.save();

    final chart = animation.value;
    for (final wave in chart.wave) {
      paint.color = wave.colour;
      canvas.drawLine(
          Offset(0.0, 0.0), Offset(1.0, -(wave.height * 60)), paint);
      canvas.drawRect(
          Rect.fromLTRB(0.0, size.height, 2.0, -(wave.height * 40)), paint);
      canvas.translate(5, 0);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(WavesPainter old) => true;
}

class Waves extends StatefulWidget {
  final state = new _WavesState();
  @override
  _WavesState createState() => state;

  void changeWaves() {
    state.changeWave();
  }
}

class _WavesState extends State<Waves> with TickerProviderStateMixin {
  static const size = const Size(100.0, 5.0);
  final random = Random();

  AnimationController animation;
  VibesTween tween;
  Timer timer;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    tween = VibesTween(
      Wave.empty(size),
      Wave.random(size, random),
    );
    animation.forward();
    timer =
        Timer.periodic(Duration(milliseconds: 500), (Timer t) => changeWave());
  }

  void changeWave() {
    setState(() {
      tween = VibesTween(
        tween.evaluate(animation),
        Wave.random(size, random),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Container(
      width: size.width,
      height: size.height / 8,
      child: CustomPaint(
        size: size,
        painter: WavesPainter(tween.animate(animation)),
      ),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    timer.cancel();
    super.dispose();
  }
}
