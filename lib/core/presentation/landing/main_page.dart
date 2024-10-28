import 'package:flutter/material.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/core/presentation/landing/home_page.dart';
import 'package:tennis_court/core/widgets/widgets.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Reservas')),
    Center(child: Text('Favoritos')),
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
        title: 'Tennis',
        actions: Row(
          children: [
            CircleAvatar(
              radius: 10,
            ),
            10.w,
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildBottomNavigationBarItem(
            icon: Icons.home,
            label: 'Inicio',
            index: 0,
          ),
          _buildBottomNavigationBarItem(
            icon: Icons.calendar_today,
            label: 'Reservas',
            index: 1,
          ),
          _buildBottomNavigationBarItem(
            icon: Icons.favorite,
            label: 'Favoritos',
            index: 2,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
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
                color: const Color(0xff82bc02),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white),
                  StyledText.bodyMedium(
                    label,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                StyledText.bodyMedium(label),
              ],
            ),
      label: '',
    );
  }
}
