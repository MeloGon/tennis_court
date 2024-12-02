import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';

import 'package:tennis_court/features/home/presentation/screens/home_page.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text(AppStrings.reservations)),
    Center(child: Text(AppStrings.favorites)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppStrings.tennis,
        actions: Row(
          children: [
            const CircleAvatar(
              radius: 10,
            ),
            10.w,
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.white,
                )),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildBottomNavigationBarItem(
            icon: Icons.home,
            label: AppStrings.init,
            index: 0,
          ),
          _buildBottomNavigationBarItem(
            icon: Icons.calendar_today,
            label: AppStrings.reservations,
            index: 1,
          ),
          _buildBottomNavigationBarItem(
            icon: Icons.favorite,
            label: AppStrings.favorites,
            index: 2,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.grey,
        showUnselectedLabels: true,
        backgroundColor: AppColors.white,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {required IconData icon, required String label, required int index}) {
    return BottomNavigationBarItem(
      icon: _selectedIndex == index
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.greenPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: AppColors.white),
                  Text(
                    label,
                    style: context.bodyMedium?.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                Text(label),
              ],
            ),
      label: '',
    );
  }
}
