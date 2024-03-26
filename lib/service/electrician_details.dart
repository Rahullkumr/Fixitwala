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
                      height: 400,
                      width: double.infinity,
                      color: Colors.green,
                      child: const Padding(
                        // service provider section
                        padding: EdgeInsets.only(top: 120, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Service Provider"),
                            // TODO: one card here
                            Text("Reviews (2)"),
                            // TODO: two cards here
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
                                "⭐ 0.0",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 10, 51, 189),
                                  fontSize: 13,
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

          },
          label: const Text("Contact Now", style: TextStyle(fontSize: 15),),
          extendedPadding: const EdgeInsets.symmetric(horizontal: 130),
          elevation: 5,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        /*
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
        */
      ),
    );
  }
}
