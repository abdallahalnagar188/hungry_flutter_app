import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';
import 'package:hungry_flutter_app/core/constance/app_images.dart';
import 'package:hungry_flutter_app/shared/custom_text.dart';

class SpicesSlider extends StatefulWidget {
  const SpicesSlider({super.key});

  @override
  State<SpicesSlider> createState() => _SpicesSliderState();
}

class _SpicesSliderState extends State<SpicesSlider> {
  double value = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Burger image
          Image.asset(
            AppImages.burgerDetails,
            width: 200,
            fit: BoxFit.contain,
          ),

          const Gap(20),

          // Right column content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Description text
                CustomText(
                  text:
                  'Customize Your Burger\nto Your Tastes.\nUltimate Experience',
                  size: 15,
                  weight: FontWeight.w400,
                ),

                const Gap(20),

                // "Spicy" label
                CustomText(text: 'Spicy', size: 14, weight: FontWeight.w600),

                // Slider
                FractionallySizedBox(
                  alignment: Alignment.centerRight,
                  widthFactor: 1.16, // 50% of available width
                  child: Slider(
                    inactiveColor: AppColors.primary.withOpacity(0.4),
                    thumbColor: AppColors.primary,
                    activeColor: AppColors.primary,
                    min: 0,
                    max: 10,
                    value: value,
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                ),


                // Row for min and max labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(text: '0', size: 14, weight: FontWeight.w500),
                    CustomText(text: '10', size: 14, weight: FontWeight.w500),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
