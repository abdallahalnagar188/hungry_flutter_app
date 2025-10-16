import 'package:flutter/material.dart';

import '../../../core/constance/app_colors.dart';
import '../../../shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({super.key, required this.text, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.white,
        ),
        onPressed: onPressed,
        child: CustomText(text: text, color: AppColors.primary, size: 18,weight: FontWeight.w500,),
      ),
    );
  }
}
