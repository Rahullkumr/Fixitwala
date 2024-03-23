import 'package:fixitwala/service/electrician_details.dart';
import 'package:flutter/material.dart';

class ElectricianPage extends StatelessWidget {
  const ElectricianPage({super.key});

  // this should come from database
  final electricianDetails = const [
    "ElectricianPage()",
    "PainterPage()",
    "CleanerPage()",
    "MechanicPage()",
    "CarpenterPage()",
    "PlumberPage()",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: electricianDetails.length,
                      itemBuilder: (context, index) {
                        return _buildServiceCard(
                            electricianDetails[index], context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildServiceCard(String page, BuildContext context) {
  return Card(
    elevation: 6,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context){
                return const ElectricianDetailsPage();
              },
            ),
          );
        },
        // onPressed: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => page),
        // ),
        child: Text(page.toString().split("Page").first), // Extract name
      ),
    ),
  );
}
