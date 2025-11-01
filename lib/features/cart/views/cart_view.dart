import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';
import 'package:hungry_flutter_app/sekaa/home/last_booking_item.dart';
import 'package:hungry_flutter_app/sekaa/home/report_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../sekaa/chat/date_range_bottom_sheet.dart';
import '../../../sekaa/home/booking_car.dart';
import '../../../sekaa/home/last_booking_list.dart';
import '../../../sekaa/home/last_tenant_item.dart';
import '../../../sekaa/home/last_tentent_list.dart';
import '../../../sekaa/home/property_item.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // A light background to see the card
      appBar: AppBar(
        title: const Text('Dashboard Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSettingsMenuTile(
              icon: Icons.local_airport,
              title: 'language'.tr, // localized
              subTitle: 'choose_language'.tr, // localized
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Wrap(
                      children: [
                        Center(
                          child: Text(
                            'choose_language'.tr,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          leading: const Icon(Icons.language),
                          title: Text('english'.tr),
                          onTap: () async {
                            var locale = const Locale('en', 'US');
                            Get.updateLocale(locale);
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('langCode', 'en');
                            await prefs.setString('countryCode', 'US');
                            Get.back(); // close bottom sheet
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.language),
                          title: Text('arabic'.tr),
                          onTap: () async {
                            var locale = const Locale('ar', 'EG');
                            Get.updateLocale(locale);
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('langCode', 'ar');
                            await prefs.setString('countryCode', 'EG');
                            Get.back(); // close bottom sheet
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Gap(20),
            // In your screen/widget
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const DateRangePickerBottomSheet(),
                );
              },
              child: const Text('Open Date Picker'),
            ),
            BookingsCard(),
            LastBookingItem(),
            Gap(20),
            LastTenantItem(
              name: "سارة خالد",
              email: "sara.khalid@yahoo.com",
              phone: "+971509876543",
              location: "دبي",
              imageAsset: 'assets/images/user.png',
            ),
            PropertyItemWidget(
                imageUrl: 'assets/images/test_prop.jpg',
            ),
            Gap(20),
            // Default red indicator (like in the image)
            ReportCard(),
            Gap(20),
            Gap(200),

          ],
        ),
      ),
    );
  }
}


class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: AppColors.primary),
      title: Text(title, style: Theme
          .of(context)
          .textTheme
          .titleMedium),
      subtitle: Text(subTitle, style: Theme
          .of(context)
          .textTheme
          .labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
