import 'package:flutter/material.dart';
import 'package:travel_app/pages/navpages/bar_item_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/navpages/my_page.dart';
import 'package:travel_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Create a List of Pages Below
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];

  // Define a var for currentIndex
  int currentIndex = 0;

  // Method for onTap function
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black45,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: "Bar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My",
          ),
        ],
      ),
    );
  }
}
