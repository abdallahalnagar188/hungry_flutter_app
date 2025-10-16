import 'package:flutter/material.dart';

import '../../../core/constance/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      color: Colors.white,
      child: TextField(
          cursorColor: AppColors.primary,
          cursorHeight: 20,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),))),
    );
  }
}
