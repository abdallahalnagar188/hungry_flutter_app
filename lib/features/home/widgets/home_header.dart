import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constance/app_colors.dart';
import '../../../core/constance/app_images.dart';
import '../../../shared/custom_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppImages.logo,color: AppColors.primary,height: 36.h),
            Gap(6),
            CustomText(
              text: 'Hello, Abdallah',
              size: 18.sp,
              color: Colors.grey.shade600,
              weight: FontWeight.w500,
            )
          ],
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(AppImages.profileIv,height: 50.h,width: 50.w),
        )
      ],
    );
  }
}
