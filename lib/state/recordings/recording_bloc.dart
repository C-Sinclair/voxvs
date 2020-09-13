import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:voxvs/state/recordings/recording_event.dart';
import 'package:voxvs/state/recordings/recording_model.dart';
import 'package:voxvs/state/recordings/recording_repo.dart';
import 'package:voxvs/state/recordings/recording_state.dart';

class UnhandledRecordingsState extends Error {}

class RecordingsBloc extends Bloc<RecordingsEvent, RecordingsState> {
  final RecordingsRepository repository;

  RecordingsBloc(this.repository) : super(RecordingsLoading());

  @override
  Stream<RecordingsState> mapEventToState(RecordingsEvent event) async* {
    if (event is RecordingsInit) {
      repository.load().listen((event) {
        add(RecordingsLoaded(event.map(Recording.fromEntity)));
      });
    } else if (event is RecordingsLoaded) {
      yield RecordingsLoadSuccess(event.recordings);
    } else if (event is RecordingAdded) {
      yield* _mapRecordingAddedToState(event);
    } else if (event is RecordingUpdated) {
      yield* _mapRecordingUpdatedToState(event);
    } else if (event is RecordingDeleted) {
      yield* _mapRecordingDeletedToState(event);
    }
  }

  Stream<RecordingsState> _mapRecordingAddedToState(
      RecordingAdded event) async* {
    if (state is RecordingsLoadSuccess) {
      final List<Recording> updated =
          List.from((state as RecordingsLoadSuccess).recordings)
            ..add(event.recording);
      yield RecordingsLoadSuccess(updated);
      _saveRecordings(updated);
    }
  }

  Stream<RecordingsState> _mapRecordingUpdatedToState(
      RecordingUpdated event) async* {
    if (state is RecordingsLoadSuccess) {
      final List<Recording> updated =
          (state as RecordingsLoadSuccess).recordings.map((r) {
        return r.id == event.recording.id ? event.recording : r;
      }).toList();
      yield RecordingsLoadSuccess(updated);
      _saveRecordings(updated);
    }
  }

  Stream<RecordingsState> _mapRecordingDeletedToState(
      RecordingDeleted event) async* {
    if (state is RecordingsLoadSuccess) {
      final List<Recording> updated = (state as RecordingsLoadSuccess)
          .recordings
          .where((r) => r.id != event.recording.id)
          .toList();
      yield RecordingsLoadSuccess(updated);
      _saveRecordings(updated);
    }
  }

  Future _saveRecordings(List<Recording> recordings) {
    return repository.save(recordings.map((r) => r.toEntity()).toList());
  }
}
