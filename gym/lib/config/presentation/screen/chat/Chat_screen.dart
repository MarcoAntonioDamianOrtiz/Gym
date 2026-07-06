import 'package:flutter/material.dart';
import 'widget/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color miRojoClarito = Color(0xFFFFCDD2);

    return Scaffold(
      backgroundColor: miRojoClarito,
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/145174331?v=4',
            ),
          ),
        ),
        title: const Text('Gym Chat'),
        centerTitle: false,
      ),
      // Aquí llamamos a la vista del chat
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  // Asegúrate de tener definido el widget MyMessageBubble
                  return const MyMessageBubble();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}