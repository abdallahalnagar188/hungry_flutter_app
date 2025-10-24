import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';

import '../../../shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.rate,
    this.onPressed,
  });

  final String image, title, desc, rate;
  final Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed ,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(image, height: 120.h, width: 120.w)),
              CustomText(text: title, size: 18.sp, weight: FontWeight.w500),
              SizedBox(
                width: 120.w,
                child: CustomText(
                  text: desc,
                  size: 14.sp,
                  weight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  CustomText(text: 'Rate: $rate', size: 14.sp, weight: FontWeight.w400),
                  Spacer(),
                  Icon(Icons.favorite, size: 24.sp,color: AppColors.primary,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
