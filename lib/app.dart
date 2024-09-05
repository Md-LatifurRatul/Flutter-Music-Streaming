import 'package:flutter/material.dart';
import 'package:flutter_spotify/core/configs/theme/app_theme.dart';
import 'package:flutter_spotify/presentation/pages/splash_page.dart';

class FlutterMusicSreamingApp extends StatelessWidget {
  const FlutterMusicSreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
