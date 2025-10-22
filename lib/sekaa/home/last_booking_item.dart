import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LastBookingItem extends StatelessWidget {
  final String bookingId;
  final String amount; // e.g., "200"
  final String currency; // e.g., "ر.ع"
  final String customerName;
  final String bookingDate;
  final String propertyName;
  final VoidCallback? onButtonPressed;

  const LastBookingItem({
    Key? key,
    this.bookingId = "13911",
    this.amount = "200",
    this.currency = "ر.ع",
    this.customerName = "أحمد محمد",
    this.bookingDate = "12/01/2025",
    this.propertyName = "زهرة الوادي للشقق المفروشه",
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We use Directionality for proper RTL layout for Arabic text.
    return Container(
      padding: const EdgeInsets.all(14),
      width: 302,
      height: 117,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 'start' is RIGHT in RTL
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Booking ID (Right side in LTR, Left side in RTL)
              Text(
                "#$bookingId",

                style: const TextStyle(
                  height: 0.8,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1442D3), // Blue icon color
                ),
              ),
              // Amount and Currency (Left side in LTR, Right side in RTL)
              Text(
                "$amount $currency",
                style: const TextStyle(
                  fontSize: 18, // Larger font size for amount
                  fontWeight: FontWeight.w700, // Extra bold for amount
                  color: Color(0xFF333333),
                  // fontFamily: 'Cairo', // Uncomment if you have a custom font
                ),
              ),

            ],
          ),

          Divider(color: Colors.grey.shade200, thickness: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Button
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FE), // Light blue background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.description, // Or a more specific document icon
                    color: Color(0xFF1442D3), // Blue icon color
                    size: 24,
                  ),
                  onPressed:
                  onButtonPressed ??
                          () {
                        // Default action if no onPressed is provided
                        print(
                          'Document button pressed for booking ID: $bookingId',
                        );
                      },
                ),
              ),
              Gap(10),
              // Details (Customer Name, Date, Property Name)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        customerName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                          // fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Dot separator
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        bookingDate,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade600,
                          // fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    propertyName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      // fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
