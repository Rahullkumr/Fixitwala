import 'package:myapp/customer/chat.dart';
import 'package:myapp/customer/contact_history.dart';
import 'package:myapp/customer/profile.dart';
import 'package:flutter/material.dart';
import 'package:myapp/customer/customer_landing.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});
  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int _selectedIndex = 0; // Track the selected index

  final List<Widget> _screens = const [
    CustomerLandingPage(),
    ContactHistory(),
    ChatPage(), 
    ProfilePage(), 
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fixitwala'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "History",
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
            type: BottomNavigationBarType.fixed,
          ),
      ),
    );
  }
}
