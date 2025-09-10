import 'package:flutter/material.dart';

extension ResponsiveHelper on BuildContext {
  bool get isSmallScreenHeight => MediaQuery.of(this).size.height < 800;
}
