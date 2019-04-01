import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlocSwitchmodeEvent extends Equatable {
  BlocSwitchmodeEvent([List props = const []]) : super(props);
}

class MoveLeft extends BlocSwitchmodeEvent {}

class MoveRight extends BlocSwitchmodeEvent {}

class MoveCenter extends BlocSwitchmodeEvent {}
