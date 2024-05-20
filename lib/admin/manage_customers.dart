import 'package:flutter/material.dart';

// TODO: implement using db

class Customer {
  final int sno;
  final String customerName;
  final String customerId;

  const Customer({
    required this.sno,
    required this.customerName,
    required this.customerId,
  });
}

class ManageCustomers extends StatelessWidget {
  const ManageCustomers({super.key});

  final List<Customer> customers = const [
    Customer(sno: 1, customerName: "Rajesh Mistri", customerId: "abc123"),
    Customer(sno: 2, customerName: "Omkar Savale", customerId: "def456"),
    Customer(sno: 3, customerName: "Harshit Mishra", customerId: "ghi789"),
    Customer(sno: 4, customerName: "Priya Patel", customerId: "fis147"),
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
                "Manage Customers",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              // Use Expanded to allow scrolling for the list
              child: ListView.builder(
                itemCount: customers.length, // Number of cards to create
                itemBuilder: (context, index) {
                  final customer = customers[index];
                  return Card(
                    child: ListTile(
                      leading: Text("${customer.sno}"),
                      title: Text(
                        customer.customerName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(customer.customerId),
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
