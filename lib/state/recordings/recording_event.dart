import 'package:equatable/equatable.dart';
import 'recording_model.dart';

abstract class RecordingsEvent extends Equatable {
  const RecordingsEvent();

  @override
  List<Object> get props => [];
}

class RecordingsInit extends RecordingsEvent {}

class RecordingsLoaded extends RecordingsEvent {
  final List<Recording> recordings;

  const RecordingsLoaded(this.recordings);

  @override
  List<Object> get props => [recordings];

  @override
  String toString() => 'RecordingLoaded { recordings: $recordings }';
}

class RecordingAdded extends RecordingsEvent {
  final Recording recording;

  const RecordingAdded(this.recording);

  @override
  List<Object> get props => [recording];

  @override
  String toString() => 'RecordingAdded { recording: $recording }';
}

class RecordingUpdated extends RecordingsEvent {
  final Recording recording;

  const RecordingUpdated(this.recording);

  @override
  List<Object> get props => [recording];

  @override
  String toString() => 'RecordingUpdated { recording: $recording }';
}

class RecordingDeleted extends RecordingsEvent {
  final Recording recording;

  const RecordingDeleted(this.recording);

  @override
  List<Object> get props => [recording];

  @override
  String toString() => 'RecordingDeleted { recording: $recording }';
}
