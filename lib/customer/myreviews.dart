import 'package:flutter/material.dart';

class MyReviewsPage extends StatelessWidget {
  const MyReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reviews'),
      ),
      body: const Center(
        child: Text("Currently you have not rated any services"),
      ),
    );
  }
}
