import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voxvs/state/recordings/recording.dart';
import 'package:voxvs/state/state.dart';

class HomeProvider extends StatelessWidget {
  final Widget child;

  const HomeProvider(
    this.child, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecorderBloc, RecorderState>(
        builder: (context, state) =>
            BlocBuilder<RecordingsBloc, RecordingsState>(
                builder: (context, state) => child));
  }
}
