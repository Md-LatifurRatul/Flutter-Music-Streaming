import 'package:flutter/material.dart';
import 'package:flutter_spotify/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify/core/configs/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppVectors.logo,
          width: 80,
          height: 80,
          colorFilter:
              const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          'Music Streaming',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        )
      ],
    );
  }
}
