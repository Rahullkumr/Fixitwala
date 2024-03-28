import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ElectricianDetailsPage extends StatelessWidget {
  ElectricianDetailsPage({super.key});

  //TODO: Replace with actual data from db
  final List<String> names = [
    'Jitender Singh',
    'Ram Shrish',
  ];
  final List<String> reviews = [
    "Good service",
    "Highly recommended!",
  ];

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
                  // for image
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.red,
                    child: const Text("Electrician photo from database"),
                  ),
                  // for service provider details and review section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 150),
                    child: Container(
                      width: double.infinity,
                      // color: Colors.green,
                      child: Padding(
                        // service provider section
                        padding: const EdgeInsets.only(
                            top: 120, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Service Provider"),
                            const SizedBox(height: 10),
                            const Card(
                              child: ListTile(
                                contentPadding: EdgeInsets.all(10),
                                leading: CircleAvatar(
                                  radius: 30,
                                  // TODO: Image from db
                                  child: Icon(Icons.person),
                                ),
                                title: Text("Name from db"),
                                subtitle: Row(
                                  // TODO: rating from db
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.green, size: 20),
                                    Icon(Icons.star,
                                        color: Colors.green, size: 20),
                                    Icon(Icons.star,
                                        color: Colors.green, size: 20),
                                    Icon(Icons.star,
                                        color: Colors.green, size: 20),
                                    Icon(Icons.star,
                                        color: Colors.green, size: 20),
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            const Text("Reviews (2)"),
                            const SizedBox(height: 10),

                            // TODO: implement after getting data from db

                            ListView.builder(
                              shrinkWrap:
                                  true, // Important for scrolling within a column
                              physics:
                                  const NeverScrollableScrollPhysics(), // Prevents double scrolling
                              itemCount: names.length,
                              itemBuilder: (context, index) {
                                final name = names[index];
                                return Card(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(10),
                                    leading: const CircleAvatar(
                                      radius: 30,
                                      // TODO: Image from db
                                      child: Icon(Icons.person),
                                    ),
                                    title: Text(
                                      name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          // TODO: date from database
                                          DateFormat('dd MMM')
                                              .format(DateTime.now()),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(reviews[index]),
                                      ],
                                    ),
                                    trailing: const Text(
                                      "⭐ 5.0",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // for floating card
                  const Padding(
                    // for stacked card on top of two rows
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                    child: Card(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              //TODO: from database
                              child: Text(
                                "Shop Name/Description",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Text("Duration",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 15)),
                              trailing: Text(
                                // TODO data from db
                                "18:02 hour",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 10, 51, 189),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Text("Rating",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 15)),
                              trailing: Text(
                                "⭐ 5.0",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //TODO: opens up a dialog having 4 options
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text('Choose any one'),
                  content: Text("hello"),
                );
              },
            );
          },
          label: const Text(
            "Contact Now",
            style: TextStyle(fontSize: 15),
          ),
          extendedPadding: const EdgeInsets.symmetric(horizontal: 130),
          elevation: 5,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
