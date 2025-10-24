
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hungry_flutter_app/features/poperty/steperView/step_screen.dart';

import '../../../sekaa/home/property_card.dart';

class PropertyListScreen extends StatefulWidget {
  const PropertyListScreen({super.key});

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  bool _isPropertyActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: Container(
        width: 58.w,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          gradient: const LinearGradient(
            colors: [Color(0xFF1442D3), Color(0xFF0A226D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () => Get.to(() => const StepScreen()),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child:  Icon(Icons.add, color: Colors.white,size: 35.sp,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      appBar: AppBar(
        title: const Text('Property Listings'),
      ),
      body: ListView(
        children: [
          PropertyCard(
            title: 'زهرة الوادي للشقق المفروشه',
            subtitle: 'فندق • صلالة',
            status: 'منشور',
            imageUrl: 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=100&q=80', // Example image URL
            isActive: _isPropertyActive,
            onToggle: (bool newValue) {
              setState(() {
                _isPropertyActive = newValue;
              });
            },
          ),
          PropertyCard(
            title: 'شقق النخيل الفندقية',
            subtitle: 'شقق • مسقط',
            status: 'غير منشور',
            imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=100&q=80',
            isActive: false,
            onToggle: (bool newValue) {
              // Handle toggle for this specific card if needed
            },
          ),
        ],
      ),
    );
  }
}