import 'package:flutter/material.dart';
import 'package:flutter_spotify/core/configs/assets/app_images.dart';
import 'package:flutter_spotify/core/configs/theme/app_colors.dart';
import 'package:flutter_spotify/presentation/pages/choose_mode/choose_mode_page.dart';
import 'package:flutter_spotify/presentation/widgets/app_logo.dart';
import 'package:flutter_spotify/presentation/widgets/basic_app_button.dart';

class FlutterMusicStreamingIntroPage extends StatelessWidget {
  const FlutterMusicStreamingIntroPage({super.key});

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
                  'Enjoy Listening To Music',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseModePage(),
                        ),
                      );
                    },
                    title: 'Get Started'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
