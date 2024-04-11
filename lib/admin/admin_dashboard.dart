import 'package:myapp/admin/manage_customers.dart';
import 'package:myapp/admin/manage_orders.dart';
import 'package:myapp/admin/manage_services.dart';
import 'package:myapp/admin/manage_sp.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0; // Track the selected index

  final List<Widget> _screens = const [
    ManageSP(),
    ManageCustomers(),
    ManageOrders(),
    ManageServices(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, // makes icon active onTap
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service),
              label: "SP",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Customers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.electrical_services),
              label: "Services",
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
