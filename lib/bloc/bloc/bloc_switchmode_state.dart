import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlocSwitchmodeState extends Equatable {
  BlocSwitchmodeState([List props = const []]) : super(props);
}

class InitialBlocSwitchmodeState extends BlocSwitchmodeState {}

class MoveLeftState extends BlocSwitchmodeState {}

class MoveRightState extends BlocSwitchmodeState {}

class MoveCenterState extends BlocSwitchmodeState {}
