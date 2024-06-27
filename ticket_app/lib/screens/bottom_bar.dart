
import 'package:flutter/material.dart';
import 'package:ticket_app/screens/home_screen.dart';
import 'package:ticket_app/screens/profile_screen.dart';
import 'package:ticket_app/screens/search_screen.dart';
import 'package:ticket_app/screens/ticket_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBaState();
}

class _BottomBaState extends State<BottomBar> {

  int _selectedIndex = 0;

  static final List _widgetOptions = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(child: _widgetOptions[_selectedIndex],),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526480),
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket),label: "Ticket"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile"),
        ],
      ),
    );
  }
}
