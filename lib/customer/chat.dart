import 'package:myapp/customer/individual_chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IndividualChat(),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('images/ava.png'),
                      radius: 25,
                    ),
                    title: const Text(
                      "Rajesh",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Hi",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      DateFormat('dd-MMM-yyyy hh:mm a').format(DateTime.now()),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
