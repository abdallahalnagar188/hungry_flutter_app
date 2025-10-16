import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';
import 'package:hungry_flutter_app/features/home/widgets/card_item.dart';
import 'package:hungry_flutter_app/features/home/widgets/home_header.dart';
import 'package:hungry_flutter_app/features/home/widgets/home_search_bar.dart';

import '../../../core/constance/app_images.dart';
import '../../../shared/custom_text.dart';

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
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 14),
         child: Column(
           children: [
             Gap(70),
             /// Header
            const HomeHeader(),

             /// Search Bar
             Gap(25),
             const HomeSearchBar(),

             /// Categories
             Gap(25),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:List.generate( categories.length, (index){
                   return GestureDetector(
                     onTap: (){
                       setState(() {
                         selectedIndex = index;
                       });
                     },
                     child: Container(
                       margin: EdgeInsets.only(right: 12),
                       padding: const EdgeInsets.symmetric(horizontal: 26,vertical: 14),
                       decoration: BoxDecoration(
                         color: selectedIndex == index? AppColors.primary : Colors.grey.shade200,
                         borderRadius: BorderRadius.circular(20),
                       ),
                       child: CustomText(text: categories[index],color:selectedIndex == index? AppColors.white: Colors.black54),

                     ),
                   );
                 }
               )),
             ),

             /// Food Items
             Gap(25),
             CardItem(image: AppImages.splash, title: 'Beef Burger', desc: 'Beef Burger with cheese and lettuce', rate: '4.5'),
             Gap(10)


           ],
         ),
       ),
      ),
    );
  }
}
