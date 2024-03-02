import 'package:fixitwala/service/carpenter.dart';
import 'package:fixitwala/service/cleaner.dart';
import 'package:fixitwala/service/electrician.dart';
import 'package:fixitwala/service/mechanic.dart';
import 'package:fixitwala/service/painter.dart';
import 'package:fixitwala/service/plumber.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final servicePages = [
    const ElectricianPage(),
    const PainterPage(),
    const CleanerPage(),
    const MechanicPage(),
    const CarpenterPage(),
    const PlumberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'This app works only in Pune City',
                style: TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Please select one",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),            
            SizedBox(
              height: 350,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: servicePages.length,
                itemBuilder: (context, index) {
                  return _buildServiceCard(servicePages[index], context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildServiceCard(Widget page, BuildContext context) {
  return Card(
    elevation: 6,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
        child: Text(page.toString().split("Page").first), // Extract name
      ),
    ),
  );
}
