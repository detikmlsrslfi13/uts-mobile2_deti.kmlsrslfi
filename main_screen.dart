import 'package:aplikasiuts1/screans/chat_screen.dart';
import 'package:aplikasiuts1/screans/home_screen.dart';
import 'package:aplikasiuts1/screans/menu_screet.dart';
import 'package:flutter/material.dart';

import 'user_screet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            HomeScreen(),
            MenuScreen(),
            ChatScreen(),
            ShopScreen(),
            UserScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: const Text('Beranda'),
              icon: const Icon(Icons.home_outlined),
              activeColor: const Color.fromARGB(255, 7, 89, 241),
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              title: const Text('Search'),
              icon: const Icon(Icons.search_outlined),
              activeColor: const Color.fromARGB(255, 7, 89, 241),
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              title: const Text('Pesan'),
              icon: const Icon(Icons.chat_outlined),
              activeColor: const Color.fromARGB(255, 7, 89, 241),
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              title: const Text('Keranjang'),
              icon: const Icon(Icons.shopping_bag_outlined),
              activeColor: const Color.fromARGB(255, 7, 89, 241),
              inactiveColor: Colors.black),
          BottomNavyBarItem(
            title: const Text('Saya'),
            icon: const Icon(Icons.perm_identity),
            activeColor: const Color.fromARGB(255, 7, 89, 241),
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

BottomNavyBarItem({required Text title, required Icon icon, required Color activeColor, required Color inactiveColor}) {
}

BottomNavyBar({required int selectedIndex, required Null Function(dynamic index) onItemSelected, required List<dynamic> items}) {
}

class ShopScreen {
  const ShopScreen();
}
