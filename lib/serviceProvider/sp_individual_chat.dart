import 'package:flutter/material.dart';

class SPIndividualChat extends StatefulWidget {
  const SPIndividualChat({super.key});

  @override
  State<SPIndividualChat> createState() => _SPIndividualChatState();
}

class _SPIndividualChatState extends State<SPIndividualChat> {
  final _textController = TextEditingController(); 
  List<String> messages = ["Hello"];

  void sendMessage(String message) {
    setState(() {
      messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lakhan"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Restrict column size
              crossAxisAlignment: CrossAxisAlignment.end, // Align to right
              children: [
                // Display the list of messages
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(messages[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: "Message",
                          hintStyle: const TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(15),
                        onPressed: () {
                          final message = _textController.text;
                          if (message.isNotEmpty) {
                            sendMessage(message);
                            _textController.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
