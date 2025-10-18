import 'package:flutter/material.dart' ;

import '../../../core/constance/app_images.dart';
import 'card_item.dart';

class FoodItems extends StatelessWidget {
  const FoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
            childCount: 8, (context, index,) {
          return CardItem(
            image: AppImages.splash,
            title: 'Pizza',
            desc: 'Lorem ipsum dolor sit amet,',
            rate: '4.5',
          );
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
      ),
    );
  }
}
