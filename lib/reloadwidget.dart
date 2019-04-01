/* import 'dart:math';

import 'package:airmeasureapp/stores/areasfromapi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

final areasfromApi = kiwi.Container().resolve<AreasFromApi>('areasfromApi');

class RefreshButton extends StatefulWidget {
  const RefreshButton({
    Key key,
  }) : super(key: key);

  @override
  _RefreshButtonState createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton>
    with SingleTickerProviderStateMixin {
  AnimationController cont;
  Animation rotateAnimation;
  Animation widthSizeAnimation;

  void initState() {
    super.initState();
    cont =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 2.0 * pi,
    ).animate(
        CurvedAnimation(parent: cont, curve: Curves.fastLinearToSlowEaseIn));
  }

  @override
  void dispose() {
    cont.dispose();
    super.dispose();
  }

  void tapRotate() {
    ///start animation and reset back to iniitial animating position
    ///so tht when user taps starts from 0 to 1(not 1 to 0)
    cont.forward().then((_) {
      cont.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 3,
        color: Colors.cyanAccent,
        child: AnimatedBuilder(
          builder: (context, child) {
            return Transform.rotate(child: child, angle: rotateAnimation.value);
          },
          child: IconButton(
              iconSize: 34,
              icon: Icon(FontAwesomeIcons.redoAlt),
              color: Colors.redAccent,
              onPressed: tapRotate),
          animation: rotateAnimation,
        ),
      ),
    );
  }
}
 */
