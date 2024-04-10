import 'package:myapp/service/mechanic_details.dart';
import 'package:flutter/material.dart';

class MechanicPage extends StatelessWidget {
  const MechanicPage({super.key});

  // this should come from database
  final mechanicDetails = const [
    "ElectricianPage()",
    "PainterPage()",
    "CleanerPage()",
    "MechanicPage()",
    "CarpenterPage()",
  ];

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
                      "All Mechanics",
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
                        itemCount: mechanicDetails.length,
                        itemBuilder: (context, index) {
                          return _buildServiceCard(
                              mechanicDetails[index], context);
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

Widget _buildServiceCard(String page, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MechanicDetailsPage();
          },
        ),
      );
      // onPressed: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => page),
      // ),
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
                  color: Colors.orange,
                  height: 90,
                  child: const Text("image here"),
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
