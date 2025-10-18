import 'package:flutter/material.dart';

import '../../../core/constance/app_colors.dart';
import '../../../shared/custom_text.dart';

class FoodCategories extends StatefulWidget {
   FoodCategories({super.key, required this.categories, required this.selectedIndex});

  late int selectedIndex = 0;
  List<String> categories;

  @override
  State<FoodCategories> createState() => _FoodCategoriesState();
}

class _FoodCategoriesState extends State<FoodCategories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
               widget.selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
              decoration: BoxDecoration(
                color: widget.selectedIndex == index
                    ? AppColors.primary
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomText(
                text: widget.categories[index],
                color: widget.selectedIndex == index
                    ? AppColors.white
                    : Colors.black54,
              ),
            ),
          );
        }),
      ),
    );
  }
}
