import 'package:flutter/material.dart';

// TODO: use a table instead of card for orders
// TODO: implement using db

class Order {
  final int sno;
  final String spName;
  final String orderId;

  const Order({
    required this.sno,
    required this.spName,
    required this.orderId,
  });
}

class ManageOrders extends StatelessWidget {
  const ManageOrders({super.key});

  final List<Order> orders = const [
    Order(sno: 1, spName: "Lakhan Painter", orderId: "#123"),
    Order(sno: 2, spName: "Lalu Electrician", orderId: "#456"),
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
                "Manage Orders",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              // Use Expanded to allow scrolling for the list
              child: ListView.builder(
                itemCount: orders.length, // Number of cards to create
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    child: ListTile(
                      leading: Text(order.sno.toString()),
                      title: Text(order.spName),
                      subtitle: Text(order.orderId),
                      trailing: const Text("Use Table here"),
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
