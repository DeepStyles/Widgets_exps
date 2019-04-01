import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BlocSwitchmodeBloc
    extends Bloc<BlocSwitchmodeEvent, BlocSwitchmodeState> {
  @override
  BlocSwitchmodeState get initialState => InitialBlocSwitchmodeState();

  @override
  Stream<BlocSwitchmodeState> mapEventToState(
    BlocSwitchmodeEvent event,
  ) async* {
    if (event is MoveLeft) {
      yield MoveLeftState();
    }
    if (event is MoveRight) {
      yield MoveRightState();
    }
    if (event is MoveCenter) {
      yield MoveCenterState();
    }
  }
}
