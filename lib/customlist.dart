import 'package:flutter/material.dart';
import 'package:flutter/src/physics/spring_simulation.dart';
import 'dart:math' as math;

/* class CustomList extends Animatable {
  @override
  _CustomListState createState() => _CustomListState();

  @override
  transform(double t) {
    // TODO: implement transform
    return null;
  }
}

class _CustomListState {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */

class CustomListSimulate extends StatefulWidget {
  @override
  _CustomListSimulateState createState() => _CustomListSimulateState();
}

class _CustomListSimulateState extends State<CustomListSimulate> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      cacheExtent: 20,
      // itemExtent: 200,
      physics: CustomScrollphysics(),
      children: List.generate(50, (index) {
        return ListTile(
          title: Text(' widget: $index'),
        );
      }),
    );
  }
}

class CustomScrollphysics implements ScrollPhysics {
  @override
  // TODO: implement allowImplicitScrolling
  bool get allowImplicitScrolling => false;

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // TODO: implement applyBoundaryConditions
    return position.pixels - value;
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // TODO: implement applyPhysicsToUserOffset
    return position.pixels + offset;
  }

  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    // TODO: implement applyTo
    return CustomScrollphysics();
  }

  @override
  ScrollPhysics buildParent(ScrollPhysics ancestor) {
    // TODO: implement buildParent
    return null;
  }

  @override
  double carriedMomentum(double existingVelocity) {
    // TODO: implement carriedMomentum
    return 0.5;
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // TODO: implement createBallisticSimulation
    // return CustomSimulation(initialPos: position.pixels, velocity: velocity);
    return ScrollSpringSimulation(
        SpringDescription(mass: 1.0, stiffness: 100, damping: 10),
        position.pixels,
        position.pixels + 2500,
        velocity);
  }

  @override
  // TODO: implement dragStartDistanceMotionThreshold
  double get dragStartDistanceMotionThreshold => 100;

  @override
  // TODO: implement maxFlingVelocity
  double get maxFlingVelocity => 20;

  @override
  // TODO: implement minFlingDistance
  double get minFlingDistance => 15;

  @override
  // TODO: implement minFlingVelocity
  double get minFlingVelocity => 10;

  @override
  // TODO: implement parent
  ScrollPhysics get parent => CustomScrollphysics();

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    // TODO: implement shouldAcceptUserOffset
    return true;
  }

  @override
  // TODO: implement spring
  SpringDescription get spring =>
      SpringDescription(mass: 1.0, damping: 10, stiffness: 50);

  @override
  // TODO: implement tolerance
  Tolerance get tolerance => Tolerance.defaultTolerance;
// ScrollPhysics app

}

class CustomSimulation extends Simulation {
  final double initialPos;
  final double velocity;

  CustomSimulation({this.initialPos, this.velocity});

  @override
  double dx(double time) {
    // TODO: implement dx
    var max = math.max(math.min(initialPos, 0.0), initialPos + velocity * time);
    return max;
  }

  @override
  bool isDone(double time) {
    // TODO: implement isDone
    return true;
  }

  @override
  double x(double time) {
    // TODO: implement x
    return velocity;
  }
}
