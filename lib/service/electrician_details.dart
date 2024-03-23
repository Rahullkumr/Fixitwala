import 'package:flutter/material.dart';

class ElectricianDetailsPage extends StatelessWidget {
  const ElectricianDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.red,
                    child: const Text("Electrician photo from database"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 150),
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      color: Colors.green,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 120),
                        child: Text("Service Provider"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 110),
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                      width: double.infinity,
                      child: const Text("Name\nDuration\nRating"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Dashboard"),
            NavigationDestination(icon: Icon(Icons.history), label: "History"),
            // NavigationDestination(icon: Icon(Icons.menu_open), label: "Services"),
            NavigationDestination(
                icon: Icon(Icons.chat_rounded), label: "Chat"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
        
      ),
    );
  }
}
