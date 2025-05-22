import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CheerBot Therapy Session",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                _ChatBubble(
                  text: "Hey there! I’m CheerBot. How are you feeling today? 😊",
                  isBot: true,
                ),
                _ChatBubble(
                  text: "I’ve been feeling a little overwhelmed lately...",
                  isBot: false,
                ),
                _ChatBubble(
                  text: "I’m sorry to hear that. Do you want to talk about what’s been on your mind?",
                  isBot: true,
                ),
              ],
            ),
          ),
          _MessageInput(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isBot;

  const _ChatBubble({required this.text, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isBot ? Theme.of(context).primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text),
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Your response here...",
                filled: true,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
