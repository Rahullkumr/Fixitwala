import 'package:flutter/material.dart';

class ServiceProviderDashboard extends StatelessWidget {
  const ServiceProviderDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: const Text("Service Provider Dashboard"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Service Provider Dashboard")),
      ),
    );
  }
}