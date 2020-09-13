import 'package:equatable/equatable.dart';
import 'recording_model.dart';

abstract class RecordingsState extends Equatable {
  const RecordingsState();

  @override
  List<Object> get props => [];
}

class RecordingsLoading extends RecordingsState {}

class RecordingsLoadSuccess extends RecordingsState {
  final List<Recording> recordings;

  const RecordingsLoadSuccess([this.recordings = const []]);

  @override
  List<Object> get props => [recordings];

  @override
  String toString() => 'RecordingsLoadSuccess { recordings: $recordings }';
}

class RecordingsLoadFailed extends RecordingsState {}
