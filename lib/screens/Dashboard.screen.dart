import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/Dashboard.controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: controller.pageCaller(controller.tabIndex) ?? Container(),
          ),
          bottomNavigationBar: controller.tabIndex == 1
              ? null
              : BottomNavigationBar(
            onTap: controller.changeTabIndex,
            backgroundColor: Colors.white70,
            currentIndex: controller.tabIndex,
            selectedItemColor: Colors.black26,
            selectedIconTheme: const IconThemeData(
              color: Colors.black26,
            ),
            unselectedItemColor: Colors.black12,
            unselectedIconTheme: const IconThemeData(
              color: Colors.black12,
            ),
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, color: Colors.black12),
                activeIcon: Icon(Icons.home_filled, color: Colors.black26),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded, color: Colors.black12),
                activeIcon:
                Icon(Icons.grid_view_rounded, color: Colors.black26),
                label: '카테고리',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_alt, color: Colors.black12),
                activeIcon: Icon(Icons.people_alt, color: Colors.black26),
                label: '커뮤니티',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined,
                    color: Colors.black12),
                activeIcon: Icon(Icons.account_circle_outlined,
                    color: Colors.black26),
                label: '마이페이지',
              ),
            ],
          ),
        );
      },
    );
  }
}
