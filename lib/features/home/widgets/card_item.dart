import 'package:flutter/material.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';

import '../../../shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.rate,
  });

  final String image, title, desc, rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, height: 120, width: 120)),
            CustomText(text: title, size: 18, weight: FontWeight.w500),
            SizedBox(
              width: 120,
              child: CustomText(
                text: desc,
                size: 14,
                weight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                CustomText(text: 'Rate: $rate', size: 14, weight: FontWeight.w400),
                Spacer(),
                Icon(Icons.favorite, size: 24,color: AppColors.primary,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
