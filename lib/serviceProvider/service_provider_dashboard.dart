import 'package:flutter/material.dart';
import 'package:myapp/serviceProvider/booking_history.dart';
import 'package:myapp/serviceProvider/sp_chat_list.dart';
import 'package:myapp/serviceProvider/sp_profile.dart';

class SPDashboard extends StatefulWidget {
  const SPDashboard({super.key});

  @override
  State<SPDashboard> createState() => _SPDashboardState();
}

class _SPDashboardState extends State<SPDashboard> {
  int _selectedIndex = 0; // Track the selected index

  final List<Widget> _screens = const [
    BookingHistory(),
    SPChatList(),
    SPProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: _selectedIndex, // makes icon active onTap
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}