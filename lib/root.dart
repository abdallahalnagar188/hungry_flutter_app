import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';

import 'features/auth/views/profile_view.dart';
import 'features/cart/views/cart_view.dart';
import 'features/home/views/home_view.dart';
import 'features/orderHistory/views/order_history_view.dart';

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  int currentPage = 0;

  late List<Widget> pages;

  @override
  void initState() {
    controller = PageController(initialPage: currentPage);
    pages = const [
      HomeView(),
      CartView(),
      OrderHistoryView(),
      ProfileView(),
    ];
    super.initState();
  }

  void _handleIndexChanged(int index) {
    setState(() {
      currentPage = index;
    });
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: CrystalNavigationBar(
          currentIndex: currentPage,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          backgroundColor: AppColors.primary.withOpacity(0.4),
          borderWidth: 2,
          outlineBorderColor: Colors.white,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: CupertinoIcons.home,
              selectedColor: Colors.white,
            ),

            /// Cart
            CrystalNavigationBarItem(
              icon: CupertinoIcons.cart_fill,
              unselectedIcon: CupertinoIcons.cart,
              selectedColor: Colors.white,
            ),

            /// Order History
            CrystalNavigationBarItem(
              icon: Icons.local_restaurant,
              unselectedIcon: Icons.local_restaurant_outlined,
              selectedColor: Colors.white,
            ),

            /// Profile
            CrystalNavigationBarItem(
              icon: Icons.person,
              unselectedIcon: Icons.person_2_outlined,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

