import 'package:flutter/material.dart';

class SPDashboard extends StatelessWidget {
  const SPDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Service Provider Dashboard"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Service Provider Dashboard")),
      ),
    );
  }
}