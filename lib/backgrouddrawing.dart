import 'package:flutter/material.dart';

class DrawExp extends StatefulWidget {
  @override
  _DrawExpState createState() => _DrawExpState();
}

class _DrawExpState extends State<DrawExp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white12,
      child: CustomPaint(
        painter: BackGroundPaint(),
      ),
    );
  }
}

class BackGroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint toppaint = Paint()
      ..filterQuality = FilterQuality.high
      ..color = Colors.deepPurpleAccent.withOpacity(0.7)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Offset center = size.center(Offset.zero);
    double radius = size.width / 4;

    canvas.drawCircle(center, radius, toppaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
