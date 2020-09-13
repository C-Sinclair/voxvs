import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:voxvs/state/state.dart';

class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  RecorderBloc() : super(RecorderIdle());

  @override
  Stream<RecorderState> mapEventToState(RecorderEvent event) async* {
    if (event is RecorderStart) {
      yield RecorderRecording();
    } else if (event is RecorderPause) {
      yield RecorderPaused();
    } else if (event is RecorderStop) {
      yield RecorderIdle();
    } else if (event is RecorderCancel) {
      yield RecorderIdle();
    }
  }
}
