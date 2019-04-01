import 'dart:math';

import 'package:flutter/material.dart';

class NesedAnimation extends StatefulWidget {
  @override
  _NesedAnimationState createState() => _NesedAnimationState();
}

class _NesedAnimationState extends State<NesedAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 2.0 * pi,
    ).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn));
  }

  void tapRotate() {
    ///start animation and reset back to iniitial animating position
    ///so tht when user taps starts from 0 to 1(not 1 to 0)
    _controller.forward().then((_) {
      _controller.reset();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedBuilder(
          builder: (context, child) {
            return Transform.rotate(child: child, angle: rotateAnimation.value);

            /*    return Transform.scale(
                  scale: scaleAnimate.value,
                  child: child,
                ); */
          },
          animation: rotateAnimation,
          child: Card(
            shape: CircleBorder(),
            elevation: 3,
            color: Colors.tealAccent,
            child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                // highlightColor: Colors.transparent,
                // splashColor: Colors.transparent,
                iconSize: 30,
                icon: Icon(Icons.access_time),
                color: Colors.redAccent,
                onPressed: tapRotate),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          shape: CircleBorder(),
          elevation: 5,
          color: Colors.tealAccent,
          child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              // splashColor: Colors.transparent,
              // iconSize: 34,
              icon: Icon(Icons.access_time),
              color: Colors.redAccent,
              onPressed: () {}),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
