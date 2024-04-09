import 'package:flutter/material.dart';

// TODO: use data from db

class ServiceProvider {
  final int sno;
  final String spName;
  final String spId;

  const ServiceProvider({
    required this.sno,
    required this.spName,
    required this.spId,
  });
}

class ManageSP extends StatelessWidget {
  const ManageSP({super.key});

  final List<ServiceProvider> sps = const [
    ServiceProvider(sno: 1, spName: "Rajesh Mistri", spId: "abc123"),
    ServiceProvider(sno: 2, spName: "Jani Cleaner", spId: "def456"),
    ServiceProvider(sno: 3, spName: "Roshan Mechanic", spId: "ghi789"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: Text(
                "Manage service providers",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              // Use Expanded to allow scrolling for the list
              child: ListView.builder(
                itemCount: sps.length, // Number of cards to create
                itemBuilder: (context, index) {
                  final sp = sps[index];
                  return Card(                    
                    child: ListTile(
                      leading: Text("${sp.sno}"),
                      title: Text(sp
                          .spName, style: const TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text(
                          sp.spId),
                      trailing: const Text(
                        "dropdown",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
