import 'package:flutter/material.dart';
import 'package:hungry_flutter_app/shared/custom_text.dart';
import '../../../core/constance/app_colors.dart';

class ToppingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onAdd;

  const ToppingCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 15,top: 4),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// Brown background container with text and add button
          Container(
            margin: const EdgeInsets.only(top: 45),
            padding: const EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 8),
            decoration: BoxDecoration(
              color: AppColors.brown,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomText(
                    text: title,
                    color: Colors.white,
                    size: 10,
                    weight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (onAdd != null)
                  GestureDetector(
                    onTap: onAdd,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white24,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: onAdd,
                          child: const Icon(Icons.add, size: 14, color: Colors.white)),
                    ),
                  ),
              ],
            ),
          ),

          /// Image on top of the brown container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
