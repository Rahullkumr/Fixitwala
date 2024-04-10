import 'package:url_launcher/url_launcher.dart';
import 'package:myapp/customer/chat.dart';
import 'package:myapp/review.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarpenterDetailsPage extends StatelessWidget {
  CarpenterDetailsPage({super.key});


  //TODO: Replace with actual data from db
  final String mobNo = "+919798567891";
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
                    child: const Text("photo from database"),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
            //TODO: get all data from db
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Center(child: Text('Contact details')),
                  actions: [
                    Wrap(
                      spacing: 8.0, // Horizontal spacing between buttons
                      runSpacing: 8.0, // Vertical spacing between buttons
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            // Handle Call button press
                            // Launch the dialer app with the phone number
                            launchUrl(Uri.parse('tel:$mobNo'));
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.green),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Call',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // Handle Chat button press
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const ChatPage();
                              }),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.orange),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Chat',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // Handle Go to Home button press
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                          ),
                          child: const Text(
                            'Go to Home',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // Handle Go to Review button press
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const GiveReview();
                              }),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                          ),
                          child: const Text(
                            'Go to Review',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
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
