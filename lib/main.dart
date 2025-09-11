import 'package:flutter/material.dart';
import 'package:shartflix/app.dart';
import 'package:shartflix/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}
