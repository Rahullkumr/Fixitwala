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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
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
                      height: height * 0.75,
                      child: GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: width * 0.025,
                          crossAxisSpacing: width * 0.02,
                          childAspectRatio: 0.72,
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
  final double width = MediaQuery.of(context).size.width;
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: width * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.013),
            child: const Text(
              "description/shop name",
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: width * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.013),
            child: Row(
              children: [
                CircleAvatar(
                  radius: width * 0.05,
                  backgroundColor: Colors.black12,
                  child: const Icon(Icons.person),
                ),
                SizedBox(width: width * 0.025),
                const Flexible(
                  child: Text(
                    "Name",
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: width * 0.02),
        ],
      ),
    ),
  );
}
