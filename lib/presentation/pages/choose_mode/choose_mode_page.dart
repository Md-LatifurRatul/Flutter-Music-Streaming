import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify/core/configs/assets/app_images.dart';
import 'package:flutter_spotify/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify/core/configs/theme/app_colors.dart';
import 'package:flutter_spotify/presentation/pages/auth/signup_or_signin_page.dart';
import 'package:flutter_spotify/presentation/pages/choose_mode/bloc/theme_cubit.dart';
import 'package:flutter_spotify/presentation/widgets/app_logo.dart';
import 'package:flutter_spotify/presentation/widgets/basic_app_button.dart';
import 'package:flutter_svg/svg.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            child: Column(
              children: [
                const AppLogo(),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _chooseDarkModeTheme(context),
                    const SizedBox(
                      width: 40,
                    ),
                    _chooseLightModeTheme(context),
                  ],
                ),
                const SizedBox(
                  height: 51,
                ),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupOrSigninPage(),
                        ),
                      );
                    },
                    title: 'Continue'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _chooseDarkModeTheme(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
          },
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff30393C).withOpacity(0.5),
                ),
                child: SvgPicture.asset(
                  AppVectors.moon,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Dark Mode',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _chooseLightModeTheme(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().updateTheme(ThemeMode.light);
          },
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff30393C).withOpacity(0.5),
                ),
                child: SvgPicture.asset(
                  AppVectors.sun,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Light Mode',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
