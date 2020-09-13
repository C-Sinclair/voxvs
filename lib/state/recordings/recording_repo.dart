import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voxvs/state/recordings/recording_entity.dart';
import 'package:voxvs/state/repo.dart';

class RecordingsRepository implements Repository<RecordingEntity> {
  static const String path = 'recordings';

  final FirebaseFirestore store;

  const RecordingsRepository(this.store);

  @override
  Stream<List<RecordingEntity>> load() {
    return store.collection(path).snapshots().map((snapshot) => snapshot.docs
        .map((e) => RecordingEntity(
              e.id,
              e.get('user'),
              e.get('duration'),
            ))
        .toList());
  }

  @override
  Future<void> add(RecordingEntity entity) async {
    return store.collection(path).doc(entity.id).set(entity.toJSON());
  }

  @override
  Future<void> delete(RecordingEntity entity) async {
    return store.collection(path).doc(entity.id).delete();
  }

  @override
  Future<void> update(RecordingEntity entity) async {
    return store.collection(path).doc(entity.id).update(entity.toJSON());
  }

  @override
  Future<void> save(List<RecordingEntity> entities) async {
    return entities
        .map((e) => store.collection(path).doc(e.id).update(e.toJSON()));
  }
}
