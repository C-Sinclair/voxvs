import 'package:equatable/equatable.dart';

abstract class RecorderState extends Equatable {
  const RecorderState();

  @override
  List<Object> get props => [];
}

class RecorderIdle extends RecorderState {}

class RecorderRecording extends RecorderState {}

class RecorderPaused extends RecorderState {}
