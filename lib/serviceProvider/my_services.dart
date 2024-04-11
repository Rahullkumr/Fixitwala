import 'package:flutter/material.dart';

class MyServices extends StatelessWidget {
  const MyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Services'),
        ),
        body: const Center(
          child: Text('My Services List'),
        ),
      ),
    );
  }
}
