import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            children: [
              Text("Admin Dashboard"),
            ],
          ),
        ),
      ),
    );
  }
}
