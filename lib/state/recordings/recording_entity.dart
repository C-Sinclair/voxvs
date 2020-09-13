import 'package:equatable/equatable.dart';

class RecordingEntity extends Equatable {
  final String id;
  final String user;
  final double duration;

  RecordingEntity(this.id, this.user, this.duration);

  Map<String, Object> toJSON() => {
        'id': id,
        'user': user,
        'duration': duration,
      };

  static RecordingEntity fromJSON(Map<String, Object> json) => RecordingEntity(
        json['id'] as String,
        json['user'] as String,
        json['duration'] as double,
      );

  @override
  List<Object> get props => [id, user, duration];

  @override
  String toString() =>
      "RecordingEntity { id: $id user: $user duration $duration }";
}
