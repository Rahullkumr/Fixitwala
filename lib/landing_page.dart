import 'package:fixitwala/service/all_carpenter.dart';
import 'package:fixitwala/service/all_cleaner.dart';
import 'package:fixitwala/service/all_electrician.dart';
import 'package:fixitwala/service/all_mechanic.dart';
import 'package:fixitwala/service/all_painter.dart';
import 'package:fixitwala/service/all_plumber.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  final servicePages = const [
    ElectricianPage(),
    PainterPage(),
    CleanerPage(),
    PlumberPage(),
    MechanicPage(),
    CarpenterPage(),
  ];

  // Helper function to extract service name from page type
  String getServiceName(Widget page) {
    return page.runtimeType.toString().replaceAll(RegExp(r'Page$'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    final servicePage = servicePages[index];
                    final serviceName = getServiceName(servicePage);
                    return _buildServiceCard(serviceName, servicePage, context); // Pass both servicePage and serviceName
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(String serviceName, Widget servicePage, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => servicePage), // Use servicePage directly
      ),
      child: Card(
        elevation: 6,
        child: Center(
          child: Text(
            serviceName,
            style: const TextStyle(
              color: Color.fromARGB(255, 52, 49, 184),
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
