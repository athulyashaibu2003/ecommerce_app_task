import 'package:ecommerce_app_task/view/cart_page/cart_page.dart';
import 'package:ecommerce_app_task/view/home_page/home_page.dart';
import 'package:ecommerce_app_task/view/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  PageController pageController = PageController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.blue,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [HomePage(), CartPage(), ProfilePage()],
        ),
        bottomNavigationBar: WaterDropNavBar(
          waterDropColor: Colors.blue,
          backgroundColor: Colors.white,
          bottomPadding: 8,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(
              selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad,
            );
          },
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
            BarItem(
              filledIcon: Icons.shopping_bag,
              outlinedIcon: Icons.shopping_bag_outlined,
            ),
            BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_outline,
            ),
          ],
        ),
      ),
    );
  }
}
