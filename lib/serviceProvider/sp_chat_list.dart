import 'package:flutter/material.dart';
import 'package:myapp/serviceProvider/sp_individual_chat.dart';

class SPChatList extends StatelessWidget {
  const SPChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Card(
        child: ListTile(
          title: const Text('Chat 1'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SPIndividualChat(),
              ),
            );
          },
        ),
      ),
    );
  }
}
