import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'core/constance/app_colors.dart';
import 'core/constance/app_images.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(280),
            SvgPicture.asset(AppImages.logo),
            Spacer(),
            Image.asset(AppImages.splash)
          ],
        ),
      )
    );
  }
}
