import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hungry_flutter_app/sekaa/chat/chat_page.dart';
import '../../../core/constance/app_images.dart';
import '../../../core/routes/app_routes.dart';
import 'card_item.dart';

class FoodItems extends StatelessWidget {
  const FoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: 8, (context, index) {
          return CardItem(
            image: AppImages.splash,
            title: 'Pizza',
            desc: 'Lorem ipsum dolor sit amet,',
            rate: '4.5',
            onPressed: () {
              Get.to(() => ChatScreen());
            },
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          mainAxisExtent: 220.h,
        ),
      ),
    );
  }
}