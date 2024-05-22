import 'package:myapp/service/electrician_details.dart';
import 'package:flutter/material.dart';

class ElectricianPage extends StatelessWidget {
  const ElectricianPage({super.key});

  // this should come from database
  final electricianDetails = const [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  final electricianImages = const {
    "1": 'images/electrician1.jpg',
    "2": 'images/electrician2.jpg',
    "3": 'images/electrician3.jpg',
    "4": 'images/electrician4.jpg',
    "5": 'images/electrician5.jpg',
    // Add more key-value pairs for other plumbers
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "All Electricians",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 600,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: electricianDetails.length,
                        itemBuilder: (context, index) {
                      final String electricianId = electricianDetails[index];
                      final String imagePath = electricianImages[electricianId] ?? 'images/default_plumber.jpg';
                          return _buildServiceCard(
                              imagePath, context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildServiceCard(String imagePath, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ElectricianDetailsPage();
          },
        ),
      );
    },
    child: Card(
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  height: 90,
                  child: Image(
                    // image: AssetImage('images/plumber$no.jpg'),
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Padding(  
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text("description/shop name",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.person),
                    ),
                    // Text("c avatar same image"),
                    SizedBox(width: 10),
                    Text("Name", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
