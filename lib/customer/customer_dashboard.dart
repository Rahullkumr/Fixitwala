import 'package:flutter/material.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: const Text("Customer Dashboard"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Customer Dashboard")),
      ),
    );
  }
}