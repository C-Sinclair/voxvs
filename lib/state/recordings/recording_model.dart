import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:voxvs/state/recordings/recording_entity.dart';

class Recording extends Equatable {
  final String id;
  final String user;
  final double duration;

  Recording({
    this.duration,
    this.user,
    String id,
  }) : this.id = id ?? Uuid().v4();

  @override
  List<Object> get props => [id, duration, user];

  @override
  String toString() {
    return 'Recording { duration: $duration id: $id user: $user }';
  }

  RecordingEntity toEntity() {
    return RecordingEntity(id, user, duration);
  }

  static Recording fromEntity(RecordingEntity entity) {
    return Recording(
      id: entity.id,
      user: entity.user,
      duration: entity.duration,
    );
  }
}
