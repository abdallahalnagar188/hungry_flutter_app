import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PropertyItemWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final int bookingsCount;
  final String imageUrl;
  final int itemId;

  const PropertyItemWidget({
    Key? key,
    this.width = 353,
    this.height = 76,
    this.title = 'زهرة الوادي للشقق المفروشه', // Placeholder title
    this.bookingsCount = 4, // Placeholder count
    this.imageUrl =
        'assets/images/test_prop.png', // Replace with your actual asset path or network image URL
    this.itemId = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF1E3A8A), // Deep blue color
                borderRadius: BorderRadius.circular(40), // Perfect circle
              ),
              alignment: Alignment.center,
              child: Text(
                '$itemId',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(width: 10),

            // 2. Property Image
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),

            Gap(10),

            Column(
              // Aligns the text content to the center of the available space
              mainAxisAlignment: MainAxisAlignment.center,
              // Aligns the text within the column to the right
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4), // Small vertical space
                Text(
                  '$bookingsCount حجوزات', // '4 حجوزات'
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
