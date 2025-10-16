import 'package:flutter/material.dart';

import '../../../shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.image, required this.title, required this.desc, required this.rate});

   final String image, title,desc,rate;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image,height: 100,width: 100),
            CustomText(text: title,size: 18,weight: FontWeight.w500),
            CustomText(text: desc,size: 14,weight: FontWeight.w400,overflow: TextOverflow.ellipsis),
            CustomText(text: 'Rate: $rate',size: 14,weight: FontWeight.w400),
          ],
        ),
      ),
    );
  }
}
