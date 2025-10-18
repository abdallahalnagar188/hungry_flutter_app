import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';
import 'package:hungry_flutter_app/features/home/widgets/card_item.dart';
import 'package:hungry_flutter_app/features/home/widgets/home_header.dart';
import 'package:hungry_flutter_app/features/home/widgets/home_search_bar.dart';

import '../../../core/constance/app_images.dart';
import '../../../shared/custom_text.dart';
import '../widgets/food_categories.dart';
import '../widgets/food_items.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late var selectedIndex = 0;

  List<String> categories = [
    'All',
    'Pizza',
    'Burger',
    'Pasta',
    'Salad',
    'Dessert',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.white,
                elevation: 0,
                pinned: true,
                floating: false,
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 190,
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(top: 70, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      /// Header
                      const HomeHeader(),

                      /// Search Bar
                      Gap(10),
                      const HomeSearchBar(),
                    ],
                  ),
                ),
              ),

              /// Appbar
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: FoodCategories(
                    categories: categories,
                    selectedIndex: selectedIndex,
                  ),
                ),
              ),

              /// Grid Items
              const FoodItems(),

            ],
          ),
        ),
      ),
    );
  }
}
