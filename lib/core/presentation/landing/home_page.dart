import 'package:flutter/material.dart';
import 'package:tennis_court/core/widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Tennis',
        actions: Row(
          children: [
            CircleAvatar(),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            //currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        //selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Reservas',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.heart_broken_outlined),
            ),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
