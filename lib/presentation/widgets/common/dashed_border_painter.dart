import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final List<double> dashes;
  final double radius;

  DashedBorderPainter({
    this.strokeWidth = 1,
    this.color = Colors.white,
    this.dashes = const [5, 5],
    this.radius = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    _addDashedRRect(path, rRect, dashes);

    canvas.drawPath(path, paint);
  }

  void _addDashedRRect(Path path, RRect rRect, List<double> dashes) {
    final double dashWidth = dashes[0];
    final double dashSpace = dashes.length > 1 ? dashes[1] : dashes[0];

    final Path borderPath = Path()..addRRect(rRect);
    final PathMetrics pathMetrics = borderPath.computeMetrics();

    for (final PathMetric metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double start = distance;
        final double end = math.min(distance + dashWidth, metric.length);
        path.addPath(metric.extractPath(start, end), Offset.zero);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color ||
        oldDelegate.dashes != dashes ||
        oldDelegate.radius != radius;
  }
}
