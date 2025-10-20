import 'package:flutter/material.dart';
import 'package:hungry_flutter_app/features/product/widgets/topping_card.dart';

import '../../../utils/helper_functions.dart';

class ToppingsList extends StatelessWidget {
  const ToppingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => ToppingCard(
          imagePath: 'assets/images/tomato.png',
          title: 'Tomato',
          onAdd: () {
            THelperFunctions.showSnackBar('Added Tomato');
          },
        ),
      ),
    );
  }
}
