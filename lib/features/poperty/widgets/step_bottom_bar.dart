import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepBottomBar extends StatelessWidget {
  final bool isLastStep;
  final VoidCallback onNext;

  const StepBottomBar({
    super.key,
    required this.isLastStep,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0.r),
          topRight: Radius.circular(20.0.r),
        ),
      ),
      height: 85.h,
      padding:  EdgeInsets.all(20.0.sp),
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1442D3), Color(0xFF0A226D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(40.0.r),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0.r),
            ),
          ),
          onPressed: onNext,
          child: Text(
            isLastStep ? 'Submit' : 'استمرار',
            style:  TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
