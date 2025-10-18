import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungry_flutter_app/features/product/widgets/spices_slider.dart';

import '../widgets/topping_card.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Icon(Icons.arrow_back)),
      ),

      body: Column(
        children: [
          SpicesSlider(),

          ToppingCard(
            imagePath: 'assets/images/tomato.png',
            title: 'Tomato',
            onAdd: () {
              print('Tomato added!');
            },
          )
        ],
      ),
    );
  }
}
