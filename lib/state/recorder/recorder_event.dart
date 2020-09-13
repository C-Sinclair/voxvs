import 'package:equatable/equatable.dart';

abstract class RecorderEvent extends Equatable {
  const RecorderEvent();

  @override
  List<Object> get props => [];
}

class RecorderStart extends RecorderEvent {}

class RecorderPause extends RecorderEvent {}

class RecorderStop extends RecorderEvent {}

class RecorderCancel extends RecorderEvent {}
