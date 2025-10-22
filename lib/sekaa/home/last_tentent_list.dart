import 'package:flutter/material.dart';

import 'last_tenant_item.dart';

// --- PASTE THE LastTenantItem WIDGET CODE HERE ---
// (Paste the code from Step 1 above)

// Simple data class for a Tenant
class TenantData {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String? imageAsset;

  TenantData({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    this.imageAsset,
  });
}

// This widget holds the horizontal list
class HorizontalTenantsList extends StatelessWidget {
  HorizontalTenantsList({Key? key}) : super(key: key);

  // 1. Create your list of different tenant data
  final List<TenantData> tenants = [
    TenantData(
      name: "فاطمة العتيبي",
      email: "fatima.otaibi@gmail.com",
      phone: "+968501234567",
      location: "سلطنة عُمان",
      // Add your image to 'assets/fatima_avatar.png'
      // imageAsset: 'assets/fatima_avatar.png',
    ),
    TenantData(
      name: "محمد عبد الله",
      email: "mohammed.abd@gmail.com",
      phone: "+966551234567",
      location: "الرياض",
      // imageAsset: 'assets/mohammed_avatar.png',
    ),
    TenantData(
      name: "سارة خالد",
      email: "sara.khalid@yahoo.com",
      phone: "+971509876543",
      location: "دبي",
      // imageAsset: 'assets/sara_avatar.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // 2. A horizontal list needs a constrained height.
    // Since the item height is 92, we'll make the list slightly taller
    // to account for vertical margins.
    return Container(
      height: 110, // 92px for the item + vertical margins
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tenants.length,

        // 3. Build each item
        itemBuilder: (context, index) {
          final tenant = tenants[index];

          // Return your custom item widget
          return LastTenantItem(
            name: tenant.name,
            email: tenant.email,
            phone: tenant.phone,
            location: tenant.location,
            imageAsset: tenant.imageAsset,
          );
        },
      ),
    );
  }
}