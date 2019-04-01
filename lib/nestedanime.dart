import 'dart:math';

import 'package:flutter/material.dart';

class ReloadWidget extends StatefulWidget {
  @override
  _ReloadWidgetState createState() => _ReloadWidgetState();
}

class _ReloadWidgetState extends State<ReloadWidget>
    with TickerProviderStateMixin {
  AnimationController _controller1;
  Animation rotateAnimation1;
  // Animation sizeAnimate;
  // Animation sizeAnimate1;
  Animation scaleAnimate;
  Animation elevationAnimate;

  @override
  void initState() {
    super.initState();
    _controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    rotateAnimation1 = Tween<double>(
      begin: 0.0,
      end: 2.0 * pi,
    ).animate(CurvedAnimation(
        parent: _controller1, curve: Curves.fastLinearToSlowEaseIn));

    scaleAnimate = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(
        parent: _controller1, curve: Curves.fastLinearToSlowEaseIn));
    elevationAnimate = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: _controller1, curve: Curves.fastLinearToSlowEaseIn));
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
  }

  void tapdoBoth() {
    ///start animation and reset back to iniitial animating position
    ///so tht when user taps starts from 0 to 1(not 1 to 0)
    _controller1.forward().then((_) {
      _controller1.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: scaleAnimate.value,
              child: Card(
                shape: CircleBorder(),
                elevation: elevationAnimate.value * 5,
                color: Colors.tealAccent,
                child: Transform.rotate(
                  angle: rotateAnimation1.value,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    iconSize: 30.0,
                    icon: Icon(Icons.access_time),
                    color: Colors.redAccent,
                    onPressed: tapdoBoth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
