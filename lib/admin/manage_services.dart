import 'package:flutter/material.dart';

// TODO: implement using db

class Service {
  final int sno;
  final String serviceName;
  final String serviceId;

  const Service({
    required this.sno,
    required this.serviceName,
    required this.serviceId,
  });
}

class ManageServices extends StatelessWidget {
  const ManageServices({super.key});

  final List<Service> services = const [
    Service(sno: 1, serviceName: "Plumbing Service", serviceId: "serv123"),
    Service(sno: 2, serviceName: "Electric Service", serviceId: "serv456"),
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
                "Manage Services",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              // Use Expanded to allow scrolling for the list
              child: ListView.builder(
                itemCount: services.length, // Number of cards to create
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Card(
                    child: ListTile(
                      leading: Text("${service.sno}"),
                      title: Text(
                        service.serviceName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(service.serviceId),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // _showForm(student);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              // await dbHelper.delete(student.id!);
                              // _refreshStudentList();
                            },
                          ),
                        ],
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
