import 'package:myapp/service/carpenter_details.dart';
import 'package:flutter/material.dart';

class CarpenterPage extends StatelessWidget {
  const CarpenterPage({super.key});

  // this should come from database
  final carpenterDetails = const [
    "carp1",
    "carp2",
    "carp3",
    "carp4",
  ];

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
                      "All Carpenters",
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
                        itemCount: carpenterDetails.length,
                        itemBuilder: (context, index) {
                          return _buildServiceCard(
                              carpenterDetails[index], context);
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
  final double width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CarpenterDetailsPage();
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
            child: Container(
              width: double.infinity,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text("image here"),
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
