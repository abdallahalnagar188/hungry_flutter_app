import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hungry_flutter_app/features/product/widgets/spices_slider.dart';
import 'package:hungry_flutter_app/shared/custom_text.dart';

import '../widgets/topping_card.dart';
import '../widgets/toppings_list.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpicesSlider(),
            Gap(15),
            CustomText(
              text: 'Topping',
              size: 18,
              color: Colors.black,
              weight: FontWeight.w600,
            ),
            ToppingsList(),
          ],
        ),
      ),
    );
  }
}
