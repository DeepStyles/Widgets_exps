import 'package:flutter/material.dart';

enum SwitchState { left, center, right }

class SwitchMapMode extends StatefulWidget {
  final Size size;

  const SwitchMapMode({this.size}) : super();

  @override
  _SwitchMapModeState createState() => _SwitchMapModeState();
}

class _SwitchMapModeState extends State<SwitchMapMode>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Offset initialOffset = Offset(0.0, 0.0);
  Offset updatedPosition = Offset(0.0, 0.0);
  // List<int> list = [];
  SwitchState state;

  @override
  void initState() {
    super.initState();
    state = SwitchState.left;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.size.width + 10,
        height: widget.size.height,
        color: Colors.transparent,
        child: Stack(
          // fit: StackFit.loose,
          children: <Widget>[
            Center(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.tealAccent),
              ),
            ),
            GestureDetector(
              onHorizontalDragStart: (startDetails) {
                initialOffset = startDetails.globalPosition;
              },
              onHorizontalDragUpdate: (updateDetails) {
                updatedPosition = updateDetails.globalPosition - initialOffset;
              },
              onHorizontalDragEnd: (endDetails) {
                if (updatedPosition.dx > 0) {
                  if (state == SwitchState.center) {
                    setState(() {
                      state = SwitchState.right;
                    });
                  }
                  if (state == SwitchState.left) {
                    setState(() {
                      state = SwitchState.center;
                    });
                  }
                }
                if (updatedPosition.dx < 0) {
                  if (state == SwitchState.center) {
                    setState(() {
                      state = SwitchState.left;
                    });
                  }
                  if (state == SwitchState.right) {
                    setState(() {
                      state = SwitchState.center;
                    });
                  }
                }
              },
              child: Align(
                alignment: state == SwitchState.left
                    ? Alignment.centerLeft
                    : state == SwitchState.center
                        ? Alignment.center
                        : Alignment.centerRight,
                child: Material(
                  elevation: 5,
                  shape: CircleBorder(),
                  color: Colors.redAccent,
                  child: Container(
                    width: widget.size.width * 0.3,
                    height: widget.size.height,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
