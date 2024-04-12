import 'package:myapp/serviceProvider/sp_individual_chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SPChatList extends StatelessWidget {
  const SPChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Chat History",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SPIndividualChat(),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: const CircleAvatar(                      
                      backgroundImage: AssetImage('images/avat.png',),
                      radius: 25,
                    ),
                    title: const Text(
                      "Lakhan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Hello",
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
