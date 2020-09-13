import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:voxvs/constants.dart';
import 'package:voxvs/state/state.dart';

class PermissionError extends Error {}

class RecordButton extends StatefulWidget {
  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  Timer timer;
  final Duration tick = Duration(milliseconds: 1000);
  final FlutterAudioRecorder recorder =
      FlutterAudioRecorder(Uuid().v1(), audioFormat: AudioFormat.WAV);

  @override
  void initState() async {
    super.initState();
    try {
      bool hasPermission = await FlutterAudioRecorder.hasPermissions;
      if (!hasPermission) {
        throw PermissionError();
      }
      await recorder.initialized;
    } catch (_) {}
  }

  void _recordingStart(RecorderBloc bloc) async {
    // Display current record component here
    bloc.add(RecorderStart());
    await recorder.start();
    timer = Timer.periodic(tick, (Timer t) {});
  }

  void _recordingEnd(RecorderBloc bloc) async {
    bloc.add(RecorderPause());
    await recorder.pause();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RecorderBloc>(context);
    return GestureDetector(
      onTapDown: (details) {
        _recordingStart(bloc);
      },
      onTapUp: (details) {
        _recordingEnd(bloc);
      },
      child: FloatingActionButton(
        child: Icon(
          Icons.mic_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colours.primary,
        onPressed: () {},
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
