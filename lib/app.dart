import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify/core/configs/theme/app_theme.dart';
import 'package:flutter_spotify/presentation/pages/choose_mode/bloc/theme_cubit.dart';
import 'package:flutter_spotify/presentation/pages/splash/splash_page.dart';

class FlutterMusicSreamingApp extends StatelessWidget {
  const FlutterMusicSreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
