import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SteperAppBar extends StatelessWidget implements PreferredSizeWidget {
  SteperAppBar({
    super.key,
    required this.progress,
    required this.currentStep,
    required this.stepTitles,
    required this.previousStep,
  });

  final void Function() previousStep;
  final double progress;
  final int currentStep;
  final List<String> stepTitles;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اضافة عقار جديد',
            style:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
           SizedBox(height: 4.h),
           Text(
             stepTitles[currentStep],
            style: TextStyle(fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: previousStep,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(8),
        child: Container(
          height: 8.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[300],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    width: constraints.maxWidth * progress,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0A226D),Color(0xFF1442D3)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(73);
}
