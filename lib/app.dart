import 'package:flutter/material.dart';
import 'package:shartflix/core/theme/app_theme.dart';
import 'package:shartflix/presentation/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shartflix',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
