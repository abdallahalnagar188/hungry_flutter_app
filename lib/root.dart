import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';

import 'features/auth/views/profile_view.dart';
import 'features/cart/views/cart_view.dart';
import 'features/home/views/home_view.dart';
import 'features/orderHistory/views/order_history_view.dart';

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
    pages = [
      const HomeView(),
      const CartView(),
      const OrderHistoryView(),
      const ProfileView(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currentPage,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade700,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
            controller.jumpToPage(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant),
              label: 'Order History',
            ),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
