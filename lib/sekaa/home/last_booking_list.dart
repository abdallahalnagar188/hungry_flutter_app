import 'package:flutter/material.dart';

import 'last_booking_item.dart';

// --- PASTE YOUR BookingData CLASS HERE ---
class BookingData {
  // (Paste class from Step 1 here)
  final String bookingId;
  final String amount;
  final String currency;
  final String customerName;
  final String bookingDate;
  final String propertyName;

  BookingData({
    required this.bookingId,
    required this.amount,
    required this.currency,
    required this.customerName,
    required this.bookingDate,
    required this.propertyName,
  });
}

// --- This is your new Horizontal List Widget ---
class HorizontalBookingsList extends StatelessWidget {
  HorizontalBookingsList({Key? key}) : super(key: key);

  // 1. Create your list of different data
  final List<BookingData> bookings = [
    BookingData(
      bookingId: "13911",
      amount: "200",
      currency: "ر.ع",
      customerName: "أحمد محمد",
      bookingDate: "12/01/2025",
      propertyName: "زهرة الوادي للشقق المفروشه",
    ),
    BookingData(
      bookingId: "13910",
      amount: "150",
      currency: "ر.ع",
      customerName: "فاطمة الزهراء",
      bookingDate: "05/12/2024",
      propertyName: "شقق الواحة الفندقية",
    ),
    BookingData(
      bookingId: "13909",
      amount: "350",
      currency: "ر.ع",
      customerName: "علياء سلطان",
      bookingDate: "20/11/2024",
      propertyName: "منتجع النخيل الفاخر",
    ),
    BookingData(
      bookingId: "13908",
      amount: "90",
      currency: "ر.ع",
      customerName: "يوسف علي",
      bookingDate: "15/11/2024",
      propertyName: "فندق سماء المدينة",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // 2. A horizontal ListView MUST have a defined height.
    // We wrap it in a Container or SizedBox.
    return Container(
      height: 200, // Adjust this height to fit your card
      child: ListView.builder(
        // 3. Set the scroll direction
        scrollDirection: Axis.horizontal,

        // 4. Set the item count from our list
        itemCount: bookings.length,

        // 5. Build each item
        itemBuilder: (context, index) {
          // Get the data for the current item
          final booking = bookings[index];

          // We wrap the item in a Container to give it a specific width
          // in the horizontal list.
          return Container(
            width: 350, // Adjust this width to fit your card
            child: LastBookingItem(
              bookingId: booking.bookingId,
              amount: booking.amount,
              currency: booking.currency,
              customerName: booking.customerName,
              bookingDate: booking.bookingDate,
              propertyName: booking.propertyName,
              onButtonPressed: () {
                print("Button pressed for booking #${booking.bookingId}");
              },
            ),
          );
        },
      ),
    );
  }
}