import 'package:flutter/material.dart';
import 'package:shartflix/src/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shartflix',
      theme: AppTheme.lightTheme,
      home: const Scaffold(body: Center(child: Text('Hello, Shartflix!'))),
    );
  }
}