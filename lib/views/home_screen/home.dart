import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:pts_app/views/cart_screen/cart_screen.dart';
import 'package:pts_app/views/category_screen/category_screen.dart';
import 'package:pts_app/views/home_screen/home_screen.dart';
import 'package:pts_app/views/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
            color: black,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
            color: black,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
            color: black,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
            color: black,
          ),
          label: account)
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Column(children: [
        Obx(() => Expanded(
            child: navBody.elementAt(controller.currentNavIndex.value)))
      ]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          items: navbarItem,
          fixedColor: Colors.black,
        ),
      ),
    );
  }
}
